const std = @import("std");

// zig version 0.10.0
pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    // Unit: "chapter_computational_complexity/time_complexity.zig"
    // Test Command: zig build test_time_complexity
    const test_time_complexity = b.addTest("chapter_computational_complexity/time_complexity.zig");
    test_time_complexity.setTarget(target);
    test_time_complexity.setBuildMode(mode);
    const test_time_complexity_step = b.step("test_time_complexity", "Run test_time_complexity");
    test_time_complexity_step.dependOn(&test_time_complexity.step);

    // Unit: "chapter_computational_complexity/worst_best_time_complexity.zig"
    // Test Command: zig build test_worst_best_time_complexity
    const test_worst_best_time_complexity = b.addTest("chapter_computational_complexity/worst_best_time_complexity.zig");
    test_worst_best_time_complexity.setTarget(target);
    test_worst_best_time_complexity.setBuildMode(mode);
    test_worst_best_time_complexity.addPackagePath("include", "include/include.zig");
    const test_worst_best_time_complexity_step = b.step("test_worst_best_time_complexity", "Run test_worst_best_time_complexity");
    test_worst_best_time_complexity_step.dependOn(&test_worst_best_time_complexity.step);

    // Unit: "chapter_computational_complexity/space_complexity.zig"
    // Test Command: zig build test_space_complexity
    const test_space_complexity = b.addTest("chapter_computational_complexity/space_complexity.zig");
    test_space_complexity.setTarget(target);
    test_space_complexity.setBuildMode(mode);
    test_space_complexity.addPackagePath("include", "include/include.zig");
    const test_space_complexity_step = b.step("test_space_complexity", "Run test_space_complexity");
    test_space_complexity_step.dependOn(&test_space_complexity.step);
}
