const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    const rna = try allocator.alloc(u8, dna.len);
    for (dna, rna) |source, *destination| {
        destination.* = switch (source) {
            'C' => 'G',
            'G' => 'C',
            'T' => 'A',
            'A' => 'U',
            else => unreachable,
        };
    }
    return rna;
}
