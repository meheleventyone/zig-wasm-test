fetch("wasmtest.wasm")
    .then(response => response.arrayBuffer())
    .then(bytes => WebAssembly.instantiate(bytes, {imports:{}}))
    .then(results => console.log(results.instance.exports.add(3,4)));