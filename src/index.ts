import express from "express";

const app = express();
const PORT = process.env.PORT;

app.get("/", async (req, res) => {
  res.send(`himmet ${process.env.NAME}.`);
});

app.listen(PORT, async () => {
  console.log(`App listening on port ${PORT}`);
});
