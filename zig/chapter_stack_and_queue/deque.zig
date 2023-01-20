// File: deque.zig
// Created Time: 2023-01-15
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 查看本地CPU架构和操作系统信息
    var native_target_info = try std.zig.system.NativeTargetInfo.detect(std.zig.CrossTarget{});
    std.debug.print("Native Info: CPU Arch = {}, OS = {}\n", .{native_target_info.target.cpu.arch, native_target_info.target.os.tag});

    // 初始化双向队列
    const L = std.TailQueue(i32);
    var deque = L{};  

    // 元素入队
    var node1 = L.Node{ .data = 2 };
    var node2 = L.Node{ .data = 5 };
    var node3 = L.Node{ .data = 4 };
    var node4 = L.Node{ .data = 3 };
    var node5 = L.Node{ .data = 1 };
    deque.append(&node1);
    deque.append(&node2);
    deque.append(&node3);
    deque.prepend(&node4);
    deque.prepend(&node5);
    std.debug.print("双向队列 queue = ", .{});
    inc.PrintUtil.printQueue(i32, deque);

    // 访问元素
    var peekFirst = deque.first.?.data;
    std.debug.print("\n队首元素 peekFirst = {}", .{peekFirst});
    var peekLast = deque.last.?.data;
    std.debug.print("\n队首元素 peekLast = {}", .{peekLast});

    // 元素出队
    var pollFirst = deque.popFirst().?.data;
    std.debug.print("\n队首出队元素 pollFirst = {}，队首出队后 deque = ", .{pollFirst});
    inc.PrintUtil.printQueue(i32, deque);
    var pollLast = deque.pop().?.data;
    std.debug.print("\n队尾出队元素 pollLast = {}，队尾出队后 deque = ", .{pollLast});
    inc.PrintUtil.printQueue(i32, deque);

    // 获取双向队列的长度
    var size = deque.len;
    std.debug.print("\n双向队列长度 size = {}", .{size});

    // 判断队列是否为空
    var isEmpty = if (deque.len == 0) true else false;
    std.debug.print("\n双向队列是否为空 = {}", .{isEmpty});

    _ = try std.io.getStdIn().reader().readByte();
}
