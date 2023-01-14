// File: array_stack.zig
// Created Time: 2023-01-08
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 基于数组实现的栈
// 编译期泛型
pub fn ArrayStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack: ?std.ArrayList(T) = null,     

        // 构造函数（分配内存+初始化栈）
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.stack == null) {
                self.stack = std.ArrayList(T).init(allocator);
            }
        }

        // 析构函数（释放内存）
        pub fn deinit(self: *Self) void {
            if (self.stack == null) return;
            self.stack.?.deinit();
        }

        // 获取栈的长度
        pub fn size(self: *Self) usize {
            return self.stack.?.items.len;
        }

        // 判断栈是否为空
        pub fn empty(self: *Self) bool {
            return self.size() == 0;
        }

        // 访问栈顶元素
        pub fn top(self: *Self) T {
            if (self.size() == 0) @panic("栈为空");
            return self.stack.?.items[self.size() - 1];
        }  

        // 入栈
        pub fn push(self: *Self, num: T) !void {
            try self.stack.?.append(num);
        } 

        // 出栈
        pub fn pop(self: *Self) T {
            var num = self.stack.?.pop();
            return num;
        } 

        // 返回 ArrayList
        pub fn toList(self: *Self) std.ArrayList(T) {
            return self.stack.?;
        }
    };
}

// Driver Code
pub fn main() !void {
    // 查看本地CPU架构和操作系统信息
    var native_target_info = try std.zig.system.NativeTargetInfo.detect(std.zig.CrossTarget{});
    std.debug.print("Native Info: CPU Arch = {}, OS = {}\n", .{native_target_info.target.cpu.arch, native_target_info.target.os.tag});

    // 初始化栈
    var stack = ArrayStack(i32){};
    stack.init(std.heap.page_allocator);
    // 延迟释放内存
    defer stack.deinit();

    // 元素入栈
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("栈 stack = ", .{});
    inc.PrintUtil.printList(i32, stack.toList());

    // 访问栈顶元素
    var top = stack.top();
    std.debug.print("\n栈顶元素 top = {}", .{top});

    // 元素出栈
    top = stack.pop();
    std.debug.print("\n出栈元素 pop = {}，出栈后 stack = ", .{top});
    inc.PrintUtil.printList(i32, stack.toList());

    // 获取栈的长度
    var size = stack.size();
    std.debug.print("\n栈的长度 size = {}", .{size});

    // 判断栈是否为空
    var empty = stack.empty();
    std.debug.print("\n栈是否为空 = {}", .{empty});

    const getchar = try std.io.getStdIn().reader().readByte();
    _ = getchar;
}
