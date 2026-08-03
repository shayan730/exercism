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

    root: ?*Node = null,
    allocator: mem.Allocator,

    pub fn init(allocator: mem.Allocator) Tree {
        return Tree{
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

    fn insertNode(allocator: mem.Allocator, node: *?*Node, data: i32) mem.Allocator.Error!void {
        if (node.*) |n| {
            if (data <= n.data) {
                try insertNode(allocator, &n.left, data);
            } else {
                try insertNode(allocator, &n.right, data);
            }
        } else {
            const new = try allocator.create(Node);
            new.* = Node{ .data = data };
            node.* = new;
        }
    }

    pub fn insert(self: *Tree, data: i32) mem.Allocator.Error!void {
        try insertNode(self.allocator, &self.root, data);
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
