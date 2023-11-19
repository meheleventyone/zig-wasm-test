// just keep a global ref to the instance around for convenience
var instance;
// this function will be imported for wasm to use
function console_log_ex(location, size) {
    var buffer = new Uint8Array(instance.exports.memory.buffer, location, size);
    var decoder = new TextDecoder();
    var string = decoder.decode(buffer);
    console.log(string);
}
// define our imports
var imports = {
    env: {
        memory: new WebAssembly.Memory({ initial: 1 }),
        console_log_ex: console_log_ex,
    }
};
// do the thing
WebAssembly.instantiateStreaming(fetch("wasmtest.wasm"), imports).then(function (results) {
    instance = results.instance;
    // grab our exported function from wasm
    var add = results.instance.exports.add;
    console.log(add(3, 4));
});
