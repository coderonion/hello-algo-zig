// File: stack.zig
// Created Time: 2023-01-08
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 查看本地CPU架构和操作系统信息
    var native_target_info = try std.zig.system.NativeTargetInfo.detect(std.zig.CrossTarget{});
    std.debug.print("Native Info: CPU Arch = {}, OS = {}\n", .{native_target_info.target.cpu.arch, native_target_info.target.os.tag});

    // 初始化栈
    // 在 zig 中，推荐将 ArrayList 当作栈来使用
    var stack = std.ArrayList(i32).init(std.heap.page_allocator);
    // 延迟释放内存
    defer stack.deinit();

    // 元素入栈
    try stack.append(1);
    try stack.append(3);
    try stack.append(2);
    try stack.append(5);
    try stack.append(4);
    std.debug.print("栈 stack = ", .{});
    inc.PrintUtil.printList(i32, stack);

    // 访问栈顶元素
    var top = stack.items[stack.items.len - 1];
    std.debug.print("\n栈顶元素 top = {}", .{top});

    // 元素出栈
    top = stack.pop();
    std.debug.print("\n出栈元素 pop = {}，出栈后 stack = ", .{top});
    inc.PrintUtil.printList(i32, stack);

    // 获取栈的长度
    var size = stack.items.len;
    std.debug.print("\n栈的长度 size = {}", .{size});

    // 判断栈是否为空
    var empty = if (stack.items.len == 0) true else false;
    std.debug.print("\n栈是否为空 = {}", .{empty});

    const getchar = try std.io.getStdIn().reader().readByte();
    _ = getchar;
}
