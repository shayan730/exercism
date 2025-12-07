const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    _ = allocator;
    var result: u64 = 0;
    for (1..limit) |num| {
        for (factors) |factor| {
            if (factor != 0 and num % factor == 0) {
                result += num;
                break;
            }
        }
    }
    return result;
}
