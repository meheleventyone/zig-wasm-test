fetch("wasmtest.wasm")
    .then(response => response.arrayBuffer())
    .then(bytes => WebAssembly.instantiate(bytes, {imports:{}}))
    .then(results => {
        const add = (results.instance.exports.add as CallableFunction);
        console.log(add(3,4));
    });