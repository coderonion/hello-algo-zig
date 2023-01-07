// File: ListNode.zig
// Created Time: 2023-01-04
// Author: sjinzh (sjinzh@gmail.com)

// Definition for a singly-linked list node
pub const ListNode = struct {
    val: i32,
    next: ?*ListNode,

    // Initialize a list node with specific value
    pub fn init(x: i32) ?*ListNode {
        return &ListNode {
            .val = x,
            .next = null,
        };
    }

    // Generate a linked list with an array
    pub fn arrToLinkedList(arr: []i32) ?*ListNode {
        var dum = ListNode.init(0);
        var head = dum;
        for (arr) |val| {
            head.next = ListNode.init(val);
            head = head.next;
        }
        return dum.next;
    }

    // Get a list node with specific value from a linked list
    pub fn getListNode(head: ?ListNode, val: i32) ?*ListNode {
        while (head != null and head.?.val != val) {
            head = head.next;
        }
        return head;
    }

 };