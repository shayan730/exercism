const std = @import("std");
pub fn isArmstrongNumber(num: u128) bool {
    var buffer: [40]u8 = undefined;

    var n_digits: u8 = 0;
    var dividend = num;
    while (dividend != 0) : (dividend /= 10) {
        buffer[n_digits] = @intCast(dividend % 10);
        n_digits += 1;
    }

    var total: u128 = 0;
    for (buffer[0..n_digits]) |digit| {
        total += std.math.pow(u128, digit, n_digits);
    }

    return num == total;
}
