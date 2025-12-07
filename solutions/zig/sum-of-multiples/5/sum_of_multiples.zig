const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var set = try std.bit_set.DynamicBitSet.initEmpty(allocator, limit);
    defer set.deinit();

    var total: u64 = 0;
    for (factors) |factor| {
        if (factor == 0) continue;
        var i = factor;
        while (i < limit) : (i += factor) {
            if (set.isSet(i)) continue;
            total += i;
            set.set(i);
        }
    }
    return total;
}
