const std = @import("std");
const Builder = std.Build;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addSharedLibrary(.{
        .name = "wasmtest",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .version = .{ .major = 0, .minor = 0, .patch = 1 },
    });
    lib.rdynamic = true;

    const install = b.addInstallArtifact(lib, .{});
    install.step.dependOn(&lib.step);
    b.default_step.dependOn(&install.step);
}
