const std = @import("std");
pub fn isArmstrongNumber(num: u128) bool {
    var n_digits: u8 = 0;
    var dividend = num;
    while (dividend != 0) {
        dividend /= 10;
        n_digits += 1;
    }
    dividend = num;
    var total: u128 = 0;
    while (dividend != 0) {
        const digit = dividend % 10;
        dividend /= 10;
        total += std.math.pow(u128, digit, n_digits);
    }
    return num == total;
}
