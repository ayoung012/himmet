const { parentPort } = require('worker_threads');
const himawari = require('@ungoldman/himawari');

const ap = "/public";
const dir = __dirname + ap

function generate() {
    const date = new Date();
    const fn = dir + '/hima-' + date.getTime().toString() + '.jpg';
    himawari({ zoom: 5,
               parallel: true,
               outfile: fn
            });
    parentPort.postMessage(fn);
    setTimeout(generate, 600000);
}

setTimeout(generate, 1000);
