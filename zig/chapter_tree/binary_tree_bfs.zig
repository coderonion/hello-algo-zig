// File: binary_tree_bfs.zig
// Created Time: 2023-01-15
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 层序遍历
fn hierOrder(comptime T: type, mem_allocator: std.mem.Allocator, root: *inc.TreeNode(T)) !std.ArrayList(T) {
    // 初始化队列，加入根结点
    const L = std.TailQueue(*inc.TreeNode(T));
    var queue = L{};
    var root_node = try mem_allocator.create(L.Node);
    root_node.data = root;
    queue.append(root_node); 
    // 初始化一个列表，用于保存遍历序列
    var list = std.ArrayList(T).init(std.heap.page_allocator);
    while (queue.len > 0) {
        var queue_node = queue.popFirst().?;    // 队列出队
        var node = queue_node.data;
        try list.append(node.val);              // 保存结点
        if (node.left != null) {
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.left.?;
            queue.append(tmp_node);             // 左子结点入队
        }
        if (node.right != null) {
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.right.?;
            queue.append(tmp_node);             // 右子结点入队
        }        
    }
    return list;
}

// Driver Code
pub fn main() !void {
    // 查看本地CPU架构和操作系统信息
    var native_target_info = try std.zig.system.NativeTargetInfo.detect(std.zig.CrossTarget{});
    std.debug.print("Native Info: CPU Arch = {}, OS = {}\n", .{native_target_info.target.cpu.arch, native_target_info.target.os.tag});

    // 初始化内存分配器
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 初始化二叉树
    // 这里借助了一个从数组直接生成二叉树的函数
    var nums = [_]i32{1, 2, 3, 4, 5, 6, 7};
    var root = try inc.TreeUtil.arrToTree(i32, mem_allocator, &nums);
    std.debug.print("初始化二叉树\n", .{});
    try inc.PrintUtil.printTree(root, null, false);

    // 层序遍历
    var list = try hierOrder(i32, mem_allocator, root.?);
    defer list.deinit();
    std.debug.print("\n层序遍历的结点打印序列 = ", .{});
    inc.PrintUtil.printList(i32, list);

    const getchar = try std.io.getStdIn().reader().readByte();
    _ = getchar;
}

