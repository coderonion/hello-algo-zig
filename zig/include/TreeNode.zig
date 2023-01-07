// File: TreeNode.zig
// Created Time: 2023-01-05
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// Definition for a binary tree node
pub const TreeNode = struct {
    val: i32 = 0,
    left: ?*TreeNode,
    right: ?*TreeNode,

    // Initialize a tree node with specific value
    pub fn init(x: i32) ?*TreeNode {
        return &TreeNode {
            .val = x,
            .left = null,
            .right = null,
        };
    }

    // Generate a binary tree with an array
    pub fn arrToTree(queue: std.TailQueue(?*TreeNode), arr: []i32) ?*TreeNode {
        if (arr.len == 0) return null;
        var root = TreeNode.init(arr[0]);
        queue.append(root);
        var i: i32 = 1;
        while (queue.len > 0) {
            var node = queue.popFirst();
            if (i < queue.len) {
                node.left = TreeNode.init(arr[i]);
                queue.append(node.left);
                i += 1;
            }
            if (i < queue.len) {
                node.right = TreeNode.init(arr[i]);
                queue.append(node.right);
                i += 1;
            }
        }
        return root;
    }

    // Serialize a binary tree to a list
    pub fn treeToArray(list: std.ArrayList(?i32), root: ?*TreeNode) ?std.ArrayList(?i32) {
        if (root == null) return null;
        var queue = std.TailQueue(?*TreeNode).init(std.testing.allocator);
        defer queue.deinit();
        queue.append(root);
        while (queue.len > 0) {
            var node = queue.popFirst();
            if (node) |node_value| {
                list.append(node_value.val);
                queue.append(node.left);
                queue.append(node.right);
            } else {
                list.append(null);
            }
            
        }
        return list;
    }

    // Get a tree node with specific value from a binary tree
    pub fn getTreeNode(root: ?*TreeNode, val: i32) ?*TreeNode {
        if (root == null) return null;
        if (root.?.val == val) return root;
        var left = getTreeNode(root.?.left, val);
        var right = getTreeNode(root.?.right, val);
        return if (left == null) right else left;
    }
 }; 