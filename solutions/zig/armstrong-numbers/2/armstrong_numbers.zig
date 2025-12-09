const std = @import("std");
pub fn isArmstrongNumber(num: u128) bool {
    if (num == 0) return 0;
    var buffer: [40]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    var allocator = fba.allocator();
    const memory = allocator.alloc(u128, 40) catch return false;
    defer allocator.free(memory);
    var n_digits: u8 = 0;
    var dividend = num;
    for (memory) |*item| {
        if (dividend != 0) {
            dividend /= 10;
            item.* = dividend;
            n_digits += 1;
        } else {
            break;
        }
    }
    var total: u128 = 0;
    for (memory, 0..) |*item, idx| {
        if (idx == n_digits) break;
        const digit = item.* % 10;
        total += std.math.pow(u128, digit, n_digits);
    }
    return num == total;
}
