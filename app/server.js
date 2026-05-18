const express = require("express");
const mongoose = require("mongoose");

const app = express();

mongoose.connect("mongodb://mongo:27017/ecommerce");

app.get("/", (req, res) => {
  res.send("E-Commerce API running ✅");
});

app.listen(3000, () => console.log("Server running"));
