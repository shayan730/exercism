const std = @import("std");
const mem = std.mem;

pub const Node = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    data: i32,
    left: ?*Node = null,
    right: ?*Node = null,
};

pub const Tree = struct {
    // This struct, as well as its fields and methods, needs to be implemented.

    root: ?*Node,
    allocator: mem.Allocator,

    pub fn init(allocator: mem.Allocator) Tree {
        return Tree{
            .root = null,
            .allocator = allocator,
        };
    }

    fn destroyNode(allocator: mem.Allocator, node: ?*Node) void {
        if (node) |n| {
            if (n.left) |child| {
                destroyNode(allocator, child);
            }
            if (n.right) |child| {
                destroyNode(allocator, child);
            }
            allocator.destroy(n);
        }
    }

    pub fn deinit(self: *Tree) void {
        destroyNode(self.allocator, self.root);
    }

    fn insertNode(node: *?*Node, new: *Node) void {
        if (node.*) |n| {
            if (new.data <= n.data) {
                insertNode(&n.left, new);
            } else {
                insertNode(&n.right, new);
            }
        } else {
        node.* = new;
        }
    }

    pub fn insert(self: *Tree, data: i32) mem.Allocator.Error!void {
        const new = try self.allocator.create(Node);
        new.* = .{ .data = data, .left = null, .right = null };
        insertNode(&self.root, new);
    }

    fn appendValue(allocator: mem.Allocator, node: ?*Node, list: *std.ArrayList(i32)) mem.Allocator.Error!void {
        if (node) |n| {
            try appendValue(allocator, n.left, list);
            try list.append(allocator, n.*.data);
            try appendValue(allocator, n.right, list);
        }
    }

    pub fn sortedData(self: *const Tree, allocator: mem.Allocator) mem.Allocator.Error![]i32 {
        var list: std.ArrayList(i32) = .empty;
        defer list.deinit(allocator);
        try appendValue(allocator, self.root, &list);
        return list.toOwnedSlice(allocator);
    }
};
