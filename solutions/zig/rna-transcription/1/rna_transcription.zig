const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var list: std.ArrayList(u8) = .empty;
    for (dna) |char| {
        switch (char) {
            'C' => try list.append(allocator, 'G'),
            'G' => try list.append(allocator, 'C'),
            'T' => try list.append(allocator, 'A'),
            'A' => try list.append(allocator, 'U'),
            else => {},
        }
    }
    return list.toOwnedSlice(allocator);
}
