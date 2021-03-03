const express = require("express");
const connection = require("./dbconfig");
const Router = express.Router();
const jwt = require("jsonwebtoken");
const cookie = require("cookie");
const niceInvoice = require("nice-invoice");
const path = require("path");

Router.get("/", (req, res, next) => {
  res.render("landing");
});

Router.get("/signup", (req, res, next) => {
  res.render("signup");
});

Router.get("/signin", (req, res, next) => {
  res.render("signin");
});

Router.get("/products", (req, res, next) => {
  connection.query(`SELECT * FROM PRODUCTS`, function (err, result) {
    if (err) throw err;
    res.render("product", { products: result });
  });
});

Router.get("/products/:sort_type", (req, res, next) => {
  connection.query(`SELECT * FROM PRODUCTS`, function (err, result) {
    if (err) throw err;
    if(req.params.sort_type === 'PRICE_ASC'){
      result.sort((a,b) => (a.productPrice >= b.productPrice) ? 1 : -1);
    } else if(req.params.sort_type === 'PRICE_DESC'){
      result.sort((a,b) => (a.productPrice >= b.productPrice) ? -1 : 1);
    } else if(req.params.sort_type==='RATING'){
      result.sort((a,b) => (a.productRating >= b.productRating) ? -1 : 1);
    }
    res.render("product", { products: result });
  });
});

Router.post("/addCart", (req, res, next) => {
  let cookies = cookie.parse(req.headers.cookie);
  if (cookies.auth) {
    jwt.verify(cookies.auth, "secret", function (err, decoded) {
      if (err) {
        res.redirect("/signin");
      } else {
        connection.query(
          `SELECT * FROM ORDERS WHERE username='${decoded.data}' and productId='${req.body.id}'`,
          function (err, previous_record) {
            // console.log(previous_record);
            if (err) throw err;
            if (previous_record.length === 0) {
              connection.query(
                `INSERT INTO ORDERS VALUES('${decoded.data}', '${parseInt(
                  req.body.id
                )}', '${parseInt("1")}')`,
                function (err, result) {
                  if (err) throw err;
                  else console.log("Added to Cart");
                }
              );
            } else {
              connection.query(
                `UPDATE ORDERS SET quantity='${
                  previous_record[0].quantity + 1
                }' WHERE username='${
                  previous_record[0].username
                }' and productId='${previous_record[0].productId}'`,
                function (err, result) {
                  if (err) throw err;
                  else console.log("Updated Product Details");
                }
              );
            }
          }
        );
      }
    });
  } else {
    res.redirect("/signin");
  }
});

Router.post("/signup", (req, res, next) => {
  connection.query(
    `SELECT * from users where username='${req.body.username}'`,
    function (err, result) {
      if (err) throw err;
      if (result.length === 0) {
        connection.query(
          `INSERT INTO users values('${req.body.username}', '${req.body.userpass}', '${req.body.useremail}','${req.body.usercountry}','${req.body.usergender}')`,
          function (err, result) {
            if (err) throw err;
            console.log("Successful Registration");
            let token = jwt.sign({ data: req.body.username }, "secret", {
              expiresIn: "24hr",
            });
            connection.query(`SELECT * FROM PRODUCTS`, function (err, result) {
              if (err) throw err;
              res.cookie("auth", token).render("product", { products: result });
            });
          }
        );
      } else {
        res.redirect("signup");
      }
    }
  );
});

Router.post("/signin", (req, res, next) => {
  connection.query(
    `SELECT * from users where username='${req.body.username}' and password='${req.body.password}'`,
    function (err, result) {
      if (err) throw err;
      if (result.length === 1) {
        let token = jwt.sign({ data: req.body.username }, "secret", {
          expiresIn: "24hr",
        });
        connection.query(`SELECT * FROM PRODUCTS`, function (err, result) {
          if (err) throw err;
          res.cookie("auth", token).render("product", { products: result });
        });
      } else {
        res.redirect("signin");
      }
    }
  );
});

Router.get("/cart", (req, res, next) => {
  connection.query(
    `SELECT * FROM orders NATURAL JOIN products`,
    function (err, result) {
      if (err) throw err;
      else {
        let total = 0;
        let tax = 0;
        for (let i = 0; i < result.length; i++) {
          total += result[i].productPrice * result[i].quantity;
        }
        tax = 0.1 * total;
        let grandTotal = total + tax;
        res.render("cart", {
          orders: result,
          subtotal: total,
          tax: tax,
          grandtotal: grandTotal,
        });
      }
    }
  );
});

Router.post("/cart", (req, res, next) => {
  let cookies = cookie.parse(req.headers.cookie);
  if (cookies.auth) {
    jwt.verify(cookies.auth, "secret", function (err, decoded) {
      if (err) throw err;
      else {
        connection.query(
          `DELETE FROM ORDERS WHERE username = '${
            decoded.data
          }' and productId='${parseInt(req.body.id)}'`,
          function (err, result) {
            if (!result.affectedRows) return;
            if (err) throw err;
            else {
              console.log("Item Removed");
              res.redirect("cart");
            }
          }
        );
      }
    });
  }
});

Router.post("/updateCart", (req, res, next) => {
  let cookies = cookie.parse(req.headers.cookie);
  if (cookies.auth) {
    jwt.verify(cookies.auth, "secret", function (err, decoded) {
      connection.query(
        `SELECT * FROM ORDERS where username='${
          decoded.data
        }' and productId='${parseInt(req.body.id)}'`,
        function (err, previous_record) {
          //console.log(previous_record);
          if (err) throw err;
          else {
            connection.query(
              `UPDATE ORDERS SET quantity='${parseInt(
                req.body.quantity
              )}' WHERE username='${decoded.data}' and productId='${
                previous_record[0].productId
              }'`,
              function (err, result) {
                if (err) throw err;
                else {
                  console.log("Updated Product Details");
                  res.redirect("cart");
                }
              }
            );
          }
        }
      );
    });
  }
});

Router.post(
  "/checkout",
  (req, res, next) => {
    console.log("checkout");
    let cookies = cookie.parse(req.headers.cookie);
    if (cookies.auth) {
      jwt.verify(cookies.auth, "secret", function (err, decoded) {
        connection.query(
          `SELECT * FROM ORDERS NATURAL JOIN products where username='${decoded.data}'`,
          function (err, previous_record, fields) {
            let items = [];
            let total = 0,
              tax = 0;
            let order_id = Math.random() * 1e20;
            for (let i = 0; i < previous_record.length; i++) {
              total +=
                previous_record[i].productPrice * previous_record[i].quantity;
              let obj = {
                item: previous_record[i].productName,
                quantity: previous_record[i].quantity,
                price: previous_record[i].productPrice,
                tax: "10%",
              };
              items.push(obj);
            }
            tax = 0.1 * total;
            const invoiceDetail = {
              shipping: {
                name: `${decoded.data}`,
              },
              items: items,
              subtotal: total,
              total: total + tax,
              order_number: `${order_id}`,
              header: {
                company_name: "My Shop",
                company_address:
                  "123 William Street 1th Floor New York, NY 123456",
              },
              footer: {
                text: "Any footer text - you can add any text here",
              },
              currency_symbol: "$",
              date: {
                billing_date: `${Date(new Date())}`,
              },
            };

            niceInvoice(
              invoiceDetail,
              path.join(__dirname, "public", `${order_id}.pdf`)
            );
            //res.sendFile(path.join(__dirname, 'invoice.pdf'));
            if (err) throw err;
            else {
              for (let i = 0; i < previous_record.length; i++) {
                connection.query(
                  `INSERT INTO past_orders VALUES('${decoded.data}','${
                    previous_record[i].productId
                  }', '${previous_record[i].quantity}', '${
                    new Date().toISOString().split("T")[0]
                  }', '${order_id}')`
                );
              }
              connection.query(
                `DELETE FROM ORDERS where username='${decoded.data}'`,
                function (err, result) {
                  if (err) throw err;
                  else {
                    req.order_id = order_id;
                    next();
                  }
                }
              );
            }
          }
        );
      });
    }
  },
  (req, res, next) => {
    res.redirect(`/placed/${req.order_id}`);
  }
);

Router.get("/placed/:order_id", (req, res, next) => {
  res.render("placed", { link: req.params.order_id });
});

module.exports = Router;
