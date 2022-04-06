fetch("wasmtest.wasm")
    .then(function (response) { return response.arrayBuffer(); })
    .then(function (bytes) { return WebAssembly.instantiate(bytes, { imports: {} }); })
    .then(function (results) {
    var add = results.instance.exports.add;
    console.log(add(3, 4));
});
