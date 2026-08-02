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
        return .{
            .root = null,
            .allocator = allocator,
        };
    }
    fn destroyNode(self: *Tree, node: ?*Node) void {
        if (node) |n| {
            self.destroyNode(n.left);
            self.destroyNode(n.right);
            self.allocator.destroy(n);
        }
    }
    pub fn deinit(self: *Tree) void {
        self.destroyNode(self.root);
        self.root = null;
    }

    fn insertNode(allocator: mem.Allocator, node: ?*Node, data: i32) mem.Allocator.Error!*Node {
        if (node) |n| {
            if (data <= n.data) {
                n.left = try insertNode(allocator, n.left, data);
            } else {
                n.right = try insertNode(allocator, n.right, data);
            }
            return n;
        } else {
            const n = try allocator.create(Node);
            n.* = .{ .data = data, .left = null, .right = null };
            return n;
        }
    }
    pub fn insert(self: *Tree, data: i32) mem.Allocator.Error!void {
        self.root = try insertNode(self.allocator, self.root, data);
    }

    fn inOrder(allocator: mem.Allocator, node: ?*Node, list: *std.ArrayList(i32)) mem.Allocator.Error!void {
        if (node) |n| {
            try inOrder(allocator, n.left, list);
            try list.append(allocator, n.data);
            try inOrder(allocator, n.right, list);
        }
    }

    pub fn sortedData(self: *const Tree, allocator: mem.Allocator) mem.Allocator.Error![]i32 {
        var list: std.ArrayList(i32) = .empty;
        defer list.deinit(allocator);
        try inOrder(self.allocator, self.root, &list);
        return list.toOwnedSlice(allocator);
    }
};
