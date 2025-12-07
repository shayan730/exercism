const std = @import("std");
pub fn convert(buffer: []u8, n: u32) []const u8 {
    var idx: u32 = 0;
    if (n % 3 == 0) {
        for ("Pling") |char| {
            buffer[idx] = char;
            idx += 1;
        }
    }
    if (n % 5 == 0) {
        for ("Plang") |char| {
            buffer[idx] = char;
            idx += 1;
        }
    }
    if (n % 7 == 0) {
        for ("Plong") |char| {
            buffer[idx] = char;
            idx += 1;
        }
    }
    if (idx == 0) {
        var remainder = n;
        while (remainder != 0) : (idx += 1) {
            buffer[idx] = std.fmt.digitToChar(@intCast(remainder % 10), .lower);
            remainder /= 10;
        }
        if (idx > 1) std.mem.reverse(u8, buffer[0..idx]);
    }
    return buffer[0..idx];
}
