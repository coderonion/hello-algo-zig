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
            self.left = null;
            self.right = null;
        }
    };   
}

// Generate a binary tree with an array
pub fn arrToTree(comptime T: type, mem_allocator: std.mem.Allocator, list: []T) !?*TreeNode(T) {
    if (list.len == 0) return null;
    var root = try mem_allocator.create(TreeNode(T));
    root.init(list[0]);

    const TailQueue = std.TailQueue(?*TreeNode(T));
    const TailQueueNode = std.TailQueue(?*TreeNode(T)).Node;
    var que = TailQueue{};
    var node_root = TailQueueNode{ .data = root };
    que.append(&node_root); 
    var index: usize = 0;
    while (que.len > 0) {
        var node = que.popFirst();
        index += 1;
        if (index >= list.len) break;
        if (index < list.len) {
            var tmp = try mem_allocator.create(TreeNode(T));
            tmp.init(list[index]);
            node.?.data.?.left = tmp;
            var a = TailQueueNode{ .data = node.?.data.?.left };
            que.append(&a);
        }
        index += 1;
        if (index >= list.len) break;
        if (index < list.len) {
            var tmp = try mem_allocator.create(TreeNode(T));
            tmp.init(list[index]);
            node.?.data.?.right = tmp;
            var a = TailQueueNode{ .data = node.?.data.?.right };
            que.append(&a);
        }
    }
    return root;
}

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