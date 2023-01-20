// File: insertion_sort.zig
// Created Time: 2023-01-08
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 插入排序
fn insertionSort(nums: []i32) void {
    // 外循环：base = nums[1], nums[2], ..., nums[n-1]
    var i: usize = 1;
    while (i < nums.len) : (i += 1) {
        var base = nums[i];
        var j: usize = i;
        // 内循环：将 base 插入到左边的正确位置
        while (j >= 1 and nums[j - 1] > base) : (j -= 1) {
            nums[j] = nums[j - 1];  // 1. 将 nums[j] 向右移动一位
        }
        nums[j] = base;             // 2. 将 base 赋值到正确位置
    }
}

// Driver Code
pub fn main() !void {
    // 查看本地CPU架构和操作系统信息
    var native_target_info = try std.zig.system.NativeTargetInfo.detect(std.zig.CrossTarget{});
    std.debug.print("Native Info: CPU Arch = {}, OS = {}\n", .{native_target_info.target.cpu.arch, native_target_info.target.os.tag});

    // 插入排序
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    insertionSort(&nums);
    std.debug.print("插入排序完成后 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    const getchar = try std.io.getStdIn().reader().readByte();
    _ = getchar;
}

