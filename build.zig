const Builder = @import("std").build.Builder;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("wasmtest.wasm", "src/main.zig");
    b.setInstallPrefix(b.build_root);
    exe.setBuildMode(mode);
    exe.setTarget(builtin.Arch.wasm32, builtin.Os.freestanding, builtin.Abi.none);
    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
