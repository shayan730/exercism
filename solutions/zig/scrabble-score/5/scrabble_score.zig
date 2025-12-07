const std = @import("std");

const bitsets = blk: {
    var result: [7]std.bit_set.IntegerBitSet(26) = @splat(.initEmpty());
    for (.{ "aeioulnrst", "dg", "bcmp", "fhvwy", "k", "jx", "qz" }, &result) |letters, *bitset| {
        for (letters) |c| {
            bitset.set(c - 'a');
        }
    }
    break :blk result;
};

pub fn score(s: []const u8) u32 {
    var count: u8 = 0;
    for (s) |char| {
        const letter = std.ascii.toLower(char) - 'a';
        for (bitsets, .{ 1, 2, 3, 4, 5, 8, 10 }) |bitset, point| {
            if (bitset.isSet(letter)) count += point;
        }
    }
    return count;
}
