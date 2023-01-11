// File: build.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// Zig Version: 0.10.0
// Build Command: zig build
pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    // Section: "Time Complexity"
        // Source File: "chapter_computational_complexity/time_complexity.c"
        // Run Command: zig build run_time_complexity
        const exe_time_complexity = b.addExecutable("time_complexity", null);
        exe_time_complexity.addCSourceFile("chapter_computational_complexity/time_complexity.c", &[_][]const u8{"-std=c99"});
        exe_time_complexity.linkSystemLibrary("c");
        exe_time_complexity.setTarget(target);
        exe_time_complexity.setBuildMode(mode);
        exe_time_complexity.install();
        const run_cmd_time_complexity = exe_time_complexity.run();
        run_cmd_time_complexity.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_time_complexity.addArgs(args);
        const run_step_time_complexity = b.step("run_time_complexity", "Run time_complexity");
        run_step_time_complexity.dependOn(&run_cmd_time_complexity.step);

        // Source File: "chapter_computational_complexity/worst_best_time_complexity.c"
        // Run Command: zig build run_worst_best_time_complexity
        const exe_worst_best_time_complexity = b.addExecutable("worst_best_time_complexity", null);
        exe_worst_best_time_complexity.addCSourceFile("chapter_computational_complexity/worst_best_time_complexity.c", &[_][]const u8{"-std=c99"});
        exe_worst_best_time_complexity.linkSystemLibrary("c");
        exe_worst_best_time_complexity.setTarget(target);
        exe_worst_best_time_complexity.setBuildMode(mode);
        exe_worst_best_time_complexity.install();
        const run_cmd_worst_best_time_complexity = exe_worst_best_time_complexity.run();
        run_cmd_worst_best_time_complexity.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_worst_best_time_complexity.addArgs(args);
        const run_step_worst_best_time_complexity = b.step("run_worst_best_time_complexity", "Run worst_best_time_complexity");
        run_step_worst_best_time_complexity.dependOn(&run_cmd_worst_best_time_complexity.step);
}