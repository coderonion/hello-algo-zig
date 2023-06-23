// File: linked_list.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 在链表的结点 n0 之后插入结点 P
pub fn insert(n0: ?*inc.ListNode(i32), P: ?*inc.ListNode(i32)) void {
    var n1 = n0.?.next;
    n0.?.next = P;
    P.?.next = n1;
}

// 删除链表的结点 n0 之后的首个结点
pub fn remove(n0: ?*inc.ListNode(i32)) void {
    if (n0.?.next == null) return;
    // n0 -> P -> n1
    var P = n0.?.next;
    var n1 = P.?.next;
    n0.?.next = n1;
}

// 访问链表中索引为 index 的结点
pub fn access(node: ?*inc.ListNode(i32), index: i32) ?*inc.ListNode(i32) {
    var head = node;
    var i: i32 = 0;
    while (i < index) : (i += 1) {
        head = head.?.next;
        if (head == null) return null;
    }
    return head;
}

// 在链表中查找值为 target 的首个结点
pub fn find(node: ?*inc.ListNode(i32), target: i32) i32 {
    var head = node;
    var index: i32 = 0;
    while (head != null) {
        if (head.?.val == target) return index;
        head = head.?.next;
        index += 1;
    }
    return -1;
}

// Driver Code
pub fn main() !void {
    // 初始化链表
    // 初始化各个结点 
    var n0 = inc.ListNode(i32){.val = 1};
    var n1 = inc.ListNode(i32){.val = 3};
    var n2 = inc.ListNode(i32){.val = 2};
    var n3 = inc.ListNode(i32){.val = 5};
    var n4 = inc.ListNode(i32){.val = 4};
    // 构建引用指向
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    std.debug.print("初始化的链表为", .{});
    try inc.PrintUtil.printLinkedList(i32, &n0);

    // 插入结点
    var tmp = inc.ListNode(i32){.val = 0};
    insert(&n0, &tmp);
    std.debug.print("插入结点后的链表为", .{});
    try inc.PrintUtil.printLinkedList(i32, &n0);

    // 删除结点
    remove(&n0);
    std.debug.print("删除结点后的链表为", .{});
    try inc.PrintUtil.printLinkedList(i32, &n0);

    // 访问结点
    var node = access(&n0, 3);
    std.debug.print("链表中索引 3 处的结点的值 = {}\n", .{node.?.val});

    // 查找结点
    var index = find(&n0, 2);
    std.debug.print("链表中值为 2 的结点的索引 = {}\n", .{index});

    _ = try std.io.getStdIn().reader().readByte();
}