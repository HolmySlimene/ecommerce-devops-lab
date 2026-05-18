const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send(`
    <html>
      <head>
        <title>E-Commerce Store</title>
        <style>
          body {
            font-family: Arial;
            background: #f4f4f4;
            text-align: center;
          }
          h1 {
            color: #333;
          }
          .container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
          }
          .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            width: 200px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
          }
          button {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
          }
          button:hover {
            background: #0056b3;
          }
        </style>
      </head>

      <body>
        <h1>🛒 E-Commerce Store</h1>

        <div class="container">
          
          <div class="card">
            <h3>Laptop 💻</h3>
            <p>Price: $1200</p>
            <button onclick="alert('Laptop added!')">Buy</button>
          </div>

          <div class="card">
            <h3>Phone 📱</h3>
            <p>Price: $800</p>
            <button onclick="alert('Phone added!')">Buy</button>
          </div>

        </div>

      </body>
    </html>
  `);
});

app.listen(3000, "0.0.0.0", () => {
  console.log("E-Commerce App running ✅");
});
