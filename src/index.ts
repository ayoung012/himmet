import express from "express";
const bodyParser = require('body-parser');
const { exec } = require('child_process');

const app = express();
const PORT = process.env.PORT;

app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", async (req, res) => {
  res.send(`himmet ${process.env.NAME}.`);
});


app.get('/explore', async (req, res) => {
    const { code, command } = req.query;

    console.log(req.query);

    if (code != process.env.NAME) {
        res.status(500).send({ error: "Wrong code" });
        return;
    }

    exec(command, (error : any, stdout : any, stderr : any) => {
        if (error) {
            console.error(`exec error: ${error}`);
            res.send(`exec error: ${error}\n\n${stdout}\n${stderr}`);
            return;
        }
        res.send(`exec: ${stdout}\n ${stderr}`);
        return;
    });
    return;

    try {
        const { stdout, stderr } = await exec(command);
        res.send({ output: stdout, err: stderr });
    } catch (error) {
        console.error(error);
        res.status(500).send({ error: error });
    }
});

app.listen(PORT, async () => {
  console.log(`App listening on port ${PORT}`);
});
