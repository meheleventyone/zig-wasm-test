const Builder = @import("std").build.Builder;
const builtin = @import("builtin");

const wasmLink : []const []const u8 = []const []const u8 {"wasm-ld", "./zig-cache/wasmtest.o", "-o", "./zig-cache/wasmtest.wasm", "-O2", "--no-entry", "--allow-undefined"};

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const obj = b.addObject("wasmtest", "src/main.zig");
    obj.setBuildMode(mode);
    obj.setTarget(builtin.Arch.wasm32, builtin.Os.freestanding, builtin.Environ.unknown);

    var main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);

    b.default_step.dependOn(&obj.step);
    _ = b.exec(wasmLink);
}
