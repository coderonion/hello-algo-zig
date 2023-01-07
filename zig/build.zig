const std = @import("std");

// zig version 0.10.0
pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    // "chapter_computational_complexity/time_complexity.zig"
    // Run Command: zig build run_time_complexity
    const exe_time_complexity = b.addExecutable("time_complexity", "chapter_computational_complexity/time_complexity.zig");
    exe_time_complexity.addPackagePath("include", "include/include.zig");
    exe_time_complexity.setTarget(target);
    exe_time_complexity.setBuildMode(mode);
    exe_time_complexity.install();
    const run_cmd_time_complexity = exe_time_complexity.run();
    run_cmd_time_complexity.step.dependOn(b.getInstallStep());
    if (b.args) |args| run_cmd_time_complexity.addArgs(args);
    const run_step_time_complexity = b.step("run_time_complexity", "Run time_complexity");
    run_step_time_complexity.dependOn(&run_cmd_time_complexity.step);

    // "chapter_computational_complexity/worst_best_time_complexity.zig"
    // Run Command: zig build run_worst_best_time_complexity
    const exe_worst_best_time_complexity = b.addExecutable("worst_best_time_complexity", "chapter_computational_complexity/worst_best_time_complexity.zig");
    exe_worst_best_time_complexity.addPackagePath("include", "include/include.zig");
    exe_worst_best_time_complexity.setTarget(target);
    exe_worst_best_time_complexity.setBuildMode(mode);
    exe_worst_best_time_complexity.install();
    const run_cmd_worst_best_time_complexity = exe_worst_best_time_complexity.run();
    run_cmd_worst_best_time_complexity.step.dependOn(b.getInstallStep());
    if (b.args) |args| run_cmd_worst_best_time_complexity.addArgs(args);
    const run_step_worst_best_time_complexity = b.step("run_worst_best_time_complexity", "Run worst_best_time_complexity");
    run_step_worst_best_time_complexity.dependOn(&run_cmd_worst_best_time_complexity.step);

    // "chapter_computational_complexity/space_complexity.zig"
    // Test Command: zig build test_space_complexity
    const test_space_complexity = b.addTest("chapter_computational_complexity/space_complexity.zig");
    test_space_complexity.addPackagePath("include", "include/include.zig");
    test_space_complexity.setTarget(target);
    test_space_complexity.setBuildMode(mode);
    const test_step_space_complexity = b.step("test_space_complexity", "Test space_complexity");
    test_step_space_complexity.dependOn(&test_space_complexity.step);

    // "chapter_computational_complexity/leetcode_two_sum.zig"
    // Run Command: zig build run_leetcode_two_sum
    const exe_leetcode_two_sum = b.addExecutable("leetcode_two_sum", "chapter_computational_complexity/leetcode_two_sum.zig");
    exe_leetcode_two_sum.addPackagePath("include", "include/include.zig");
    exe_leetcode_two_sum.setTarget(target);
    exe_leetcode_two_sum.setBuildMode(mode);
    exe_leetcode_two_sum.install();
    const run_cmd_leetcode_two_sum = exe_leetcode_two_sum.run();
    run_cmd_leetcode_two_sum.step.dependOn(b.getInstallStep());
    if (b.args) |args| run_cmd_leetcode_two_sum.addArgs(args);
    const run_step_leetcode_two_sum = b.step("run_leetcode_two_sum", "Run leetcode_two_sum");
    run_step_leetcode_two_sum.dependOn(&run_cmd_leetcode_two_sum.step);
}
