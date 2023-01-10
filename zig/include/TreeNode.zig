// File: TreeNode.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// Definition for a binary tree node
// 编译期泛型
pub fn TreeNode(comptime T: type) type {
    return struct {
        const Self = @This();

        val: T = undefined,
        left: ?*Self = null,
        right: ?*Self = null,

        // Initialize a tree node with specific value
        pub fn init(self: *Self, x: T) void {
            self.val = x;
        }

        // // Generate a binary tree with an array
        // pub fn arrToTree(queue: std.TailQueue(?*Self), arr: []i32) ?*Self {
        //     if (arr.len == 0) return null;
        //     var root = Self.init(arr[0]);
        //     queue.append(root);
        //     var i: i32 = 1;
        //     while (queue.len > 0) {
        //         var node = queue.popFirst();
        //         if (i < queue.len) {
        //             node.left = Self.init(arr[i]);
        //             queue.append(node.left);
        //             i += 1;
        //         }
        //         if (i < queue.len) {
        //             node.right = Self.init(arr[i]);
        //             queue.append(node.right);
        //             i += 1;
        //         }
        //     }
        //     return root;
        // }

        // // Serialize a binary tree to a list
        // pub fn treeToArray(list: std.ArrayList(?i32), root: ?*Self) ?std.ArrayList(?i32) {
        //     if (root == null) return null;
        //     var queue = std.TailQueue(?*Self).init(std.testing.allocator);
        //     defer queue.deinit();
        //     queue.append(root);
        //     while (queue.len > 0) {
        //         var node = queue.popFirst();
        //         if (node) |node_value| {
        //             list.append(node_value.val);
        //             queue.append(node.left);
        //             queue.append(node.right);
        //         } else {
        //             list.append(null);
        //         }
                
        //     }
        //     return list;
        // }

        // // Get a tree node with specific value from a binary tree
        // pub fn getTreeNode(root: ?*Self, val: i32) ?*Self {
        //     if (root == null) return null;
        //     if (root.?.val == val) return root;
        //     var left = getTreeNode(root.?.left, val);
        //     var right = getTreeNode(root.?.right, val);
        //     return if (left == null) right else left;
        // }
    };   
}