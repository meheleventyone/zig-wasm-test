const std = @import("std");
const Builder = std.build.Builder;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    const lib = b.addSharedLibrary(.{
        .name = "wasmtest",
        .root_source_file = .{.path = "src/main.zig" },
        .target = .{.cpu_arch = .wasm32, .os_tag = .freestanding},
        .optimize = .Debug,
        .version = .{.major = 0, .minor = 0, .patch=1},
        });
    lib.rdynamic = true;
    
    const install = b.addInstallArtifact(lib, .{});
    install.step.dependOn(&lib.step);
    b.default_step.dependOn(&install.step);
}
