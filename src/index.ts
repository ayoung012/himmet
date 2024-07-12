import express from "express";
const bodyParser = require('body-parser');
const { exec } = require('child_process');

const { Worker } = require('worker_threads');

// @ts-ignore
const worker = new Worker(process[Symbol.for("ts-node.register.instance")] ? './src/worker.ts' : __dirname + '/worker.js');

worker.on('message', (result : String) => {
   console.log('result', result);
});

worker.on("error", (msg : String) => {
    console.log(msg);
});


const app = express();
const PORT = process.env.PORT;

app.use(bodyParser.urlencoded({ extended: true }));

const ap = "/public";
const dir = __dirname + ap;
app.use(ap, express.static(dir));

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

});

app.listen(PORT, async () => {
  console.log(`App listening on port ${PORT}`);
});
