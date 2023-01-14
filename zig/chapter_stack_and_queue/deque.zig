// File: deque.zig
// Created Time: 2023-01-08
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");
const TailQueue = std.TailQueue(i32);
const TailQueueNode = std.TailQueue(i32).Node;

// Driver Code
pub fn main() !void {
    // 查看本地CPU架构和操作系统信息
    var native_target_info = try std.zig.system.NativeTargetInfo.detect(std.zig.CrossTarget{});
    std.debug.print("Native Info: CPU Arch = {}, OS = {}\n", .{native_target_info.target.cpu.arch, native_target_info.target.os.tag});

    // 初始化双向队列
    var deque = TailQueue{};

    // 元素入队
    var node1 = TailQueueNode{ .data = 2 };
    var node2 = TailQueueNode{ .data = 5 };
    var node3 = TailQueueNode{ .data = 4 };
    var node4 = TailQueueNode{ .data = 3 };
    var node5 = TailQueueNode{ .data = 1 };
    deque.append(&node1);   // 添加至队尾
    deque.append(&node2);
    deque.append(&node3);
    deque.prepend(&node4);  // 添加至队首
    deque.prepend(&node5);
    std.debug.print("双向队列 deque = ", .{});
    inc.PrintUtil.printDeque(i32, deque);

    // // 访问元素
    // var front = deque.first.?.data;
    // std.debug.print("\n队首元素 front = {}", .{front});
    // var back = deque.last.?.data;
    // std.debug.print("\n队尾元素 back = {}", .{back});

    // // 元素出队
    // front = deque.popFirst().?.data;
    // std.debug.print("\n队首出队元素 popFront = {}，队首出队后 deque = ", .{front});
    // inc.PrintUtil.printDeque(i32, deque);
    // std.debug.print("{}", .{deque.len});
    // deque.remove(deque.last.?);
    // _ = back;
    // std.debug.print("\n队尾出队元素 popLast = {}，队尾出队后 deque = ", .{back});
    // inc.PrintUtil.printDeque(i32, deque);

    // // 获取栈的长度
    // var size = stack.items.len;
    // std.debug.print("\n栈的长度 size = {}", .{size});

    // // 判断栈是否为空
    // var empty = if (stack.items.len == 0) true else false;
    // std.debug.print("\n栈是否为空 = {}", .{empty});

    const getchar = try std.io.getStdIn().reader().readByte();
    _ = getchar;
}
