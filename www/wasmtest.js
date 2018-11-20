fetch("wasmtest.wasm")
    .then(function (response) { return response.arrayBuffer(); })
    .then(function (bytes) { return WebAssembly.instantiate(bytes, { imports: {} }); })
    .then(function (results) { return console.log(results.instance.exports.add(3, 4)); });
