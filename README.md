# zig-wasm-test
A minimal Web Assembly example built from Zig's init-lib.

I expanded on this great gist from @josephg 

https://gist.github.com/josephg/873a21d4558fd69aeccea19c3df96672

To build this project you need to follow the steps there to get a wasm enabled version of LLVM setup.

## Building

To build this project with a working Zig and TypeScript install at the project root just type.

```
zig build -Drelease-small
```

You need to move the resulting wasmtest.wasm file from /zig-cache/ to /www/. One has been committed if you're happy omitting this step.

For good measure you can then build the TypeScript file:

```
cd www
tsc wasmtest.ts
```

# Running
Start the web server of your choice serving the www folder and navigate to wasmtest.html in your browser of choice. The value 7 should be output in the console.
