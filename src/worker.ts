const { parentPort } = require('worker_threads');
const himawari = require('himawari');

const ap = "/public";
const dir = __dirname + ap

function generate() {
    const date = new Date();
    const fn = dir + '/hima-' + date.getTime().toString();
    himawari({ zoom: 5,
               date: date,
               parallel: true,
               outfile: fn
            });
    parentPort.postMessage(fn);
    setTimeout(generate, 600000);
}

setTimeout(generate, 1000);
