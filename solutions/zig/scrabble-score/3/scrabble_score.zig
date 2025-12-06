const std = @import("std");
pub fn score(s: []const u8) u32 {
    var count: u8 = 0;
    for (s) |char| {
        const letter = std.ascii.toLower(char) - 'a';
        inline for (.{ "aeioulnrst", "dg", "bcmp", "fhvwy", "k", "jx", "qz" }, .{ 1, 2, 3, 4, 5, 8, 10 }) |letters, point| {
            var bitset = std.bit_set.IntegerBitSet(26).initEmpty();
            for (letters) |c| {
                bitset.set(c - 'a');
            }
            if (bitset.isSet(letter)) count += point;
        }
    }
    return count;
}
