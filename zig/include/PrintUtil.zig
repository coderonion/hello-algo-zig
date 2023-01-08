// File: TreeNode.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const ListNode = @import("ListNode.zig").ListNode;
const TreeNode = @import("TreeNode.zig").TreeNode;

// Print an array
pub fn printArray(comptime T: type, nums: []T) void {
    std.debug.print("[", .{});
    if (nums.len > 0) {
        for (nums) |num, j| {
            std.debug.print("{}{s}", .{num, if (j == nums.len-1) "]\n" else ", " });
        }
    } else {
        std.debug.print("]", .{});
        std.debug.print("\n", .{});
    }
}

// Print a list
pub fn printList(list: std.ArrayList(i32)) void {
    std.debug.print("[", .{});
    if (list.items.len > 0) {
        for (list.items) |value, i| {
            std.debug.print("{}{s}", .{value, if (i == list.items.len-1) "]\n" else ", " });
        }
    } else {
        std.debug.print("]", .{});
        std.debug.print("\n", .{}); 
    }
    
}

// Print a linked list
pub fn printLinkedList(node: ?*ListNode(i32)) !void {
    if (node == null) return;
    var list = std.ArrayList(i32).init(std.heap.page_allocator);
    defer list.deinit();
    var head = node;
    while (head != null) {
        try list.append(head.?.val);
        head = head.?.next;
    }
    for (list.items) |value, i| {
        std.debug.print("{}{s}", .{value, if (i == list.items.len-1) "\n" else "->" });
    }
}

// This tree printer is borrowed from TECHIE DELIGHT
// https://www.techiedelight.com/c-program-print-binary-tree/
const Trunk = struct {
    prev: ?*Trunk = null,
    str: []const u8 = undefined,
    
    pub fn init(self: *Trunk, prev: ?*Trunk, str: []const u8) void {
        self.prev = prev;
        self.str = str;
    }
};

// Helper function to print branches of the binary tree
pub fn showTrunks(p: ?*Trunk) void {
    if (p == null) return;
    showTrunks(p.?.prev);
    std.debug.print("{s}", .{p.?.str});
}

// The interface of the tree printer
// Print a binary tree
pub fn printTree(root: ?*TreeNode(i32), prev: ?*Trunk, isLeft: bool) !void {
    if (root == null) {
        return;
    }

    var prev_str = "    ";
    var trunk = Trunk{.prev = prev, .str = prev_str};

    try printTree(root.?.right, &trunk, true);
   
    if (prev == null) {
        trunk.str = "———";
    } else if (isLeft) {
        trunk.str = "/———";
        prev_str = "   |";
    } else {
        trunk.str = "\\———";
        prev.?.str = prev_str;
    }

    showTrunks(&trunk);
    std.debug.print(" {}\n", .{root.?.val});

    if (prev) |_| {
        prev.?.str = prev_str;
    }
    trunk.str = "   |";

    try printTree(root.?.left, &trunk, false);
}

