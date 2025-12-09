const std = @import("std");
pub fn isArmstrongNumber(num: u128) bool {
    var buffer: [40]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    var allocator = fba.allocator();
    const digits = allocator.alloc(u8, 40) catch return false;
    defer allocator.free(digits);

    var n_digits: u8 = 0;
    var dividend = num;
    for (digits) |*item| {
        if (dividend != 0) {
            item.* = @intCast(dividend % 10);
            dividend /= 10;
            n_digits += 1;
        } else {
            break;
        }
    }

    var total: u128 = 0;
    for (digits, 0..) |*digit, idx| {
        if (idx == n_digits) break;
        total += std.math.pow(u128, digit.*, n_digits);
    }

    return num == total;
}
