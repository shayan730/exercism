const std = @import("std");
pub fn convert(buffer: []u8, n: u32) []const u8 {
    var index: u32 = 0;
    if (n % 3 == 0) {
        for ("Pling") |char| {
            buffer[index] = char;
            index += 1;
        }
    }
    if (n % 5 == 0) {
        for ("Plang") |char| {
            buffer[index] = char;
            index += 1;
        }
    }
    if (n % 7 == 0) {
        for ("Plong") |char| {
            buffer[index] = char;
            index += 1;
        }
    }
    if (index == 0) {
        var remainder = n;
        while (remainder != 0) : (index += 1) {
            const char: u8 = @intCast(remainder % 10);
            buffer[index] = char + '0';
            remainder /= 10;
        }
        if (index > 1) std.mem.reverse(u8, buffer[0..index]);
    }
    return buffer[0..index];
}
