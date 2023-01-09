// File: ListNode.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// Definition for a singly-linked list node
// 编译时泛型
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();
        
        val: T = 0,
        next: ?*Self = null,

        // Initialize a list node with specific value
        pub fn init(self: *Self, x: T) void {
            self.val = x;
        }

        // // Generate a linked list with an array
        // pub fn arrToLinkedList(arr: []i32) ?*Self {
        //     var dum = Self.init(0);
        //     var head = dum;
        //     for (arr) |val| {
        //         head.next = Self.init(val);
        //         head = head.next;
        //     }
        //     return dum.next;
        // }

        // // Get a list node with specific value from a linked list
        // pub fn getListNode(head: ?Self, val: i32) ?*Self {
        //     while (head != null and head.?.val != val) {
        //         head = head.next;
        //     }
        //     return head;
        // }
    };
}