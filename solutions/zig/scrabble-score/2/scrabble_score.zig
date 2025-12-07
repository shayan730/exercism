const std = @import("std");
pub fn score(s: []const u8) u32 {
    const ones = comptime blk: {
        var bitset = std.bit_set.IntegerBitSet(26).initEmpty();
        for ("aeioulnrst") |char| {
            bitset.set(char - 'a');
        }
        break :blk bitset;
    };

    const twos = comptime blk: {
        var bitset = std.bit_set.IntegerBitSet(26).initEmpty();
        for ("dg") |char| {
            bitset.set(char - 'a');
        }
        break :blk bitset;
    };

    const threes = comptime blk: {
        var bitset = std.bit_set.IntegerBitSet(26).initEmpty();
        for ("bcmp") |char| {
            bitset.set(char - 'a');
        }
        break :blk bitset;
    };

    const fours = comptime blk: {
        var bitset = std.bit_set.IntegerBitSet(26).initEmpty();
        for ("fhvwy") |char| {
            bitset.set(char - 'a');
        }
        break :blk bitset;
    };

    const fives = comptime blk: {
        var bitset = std.bit_set.IntegerBitSet(26).initEmpty();
        for ("k") |char| {
            bitset.set(char - 'a');
        }
        break :blk bitset;
    };

    const eights = comptime blk: {
        var bitset = std.bit_set.IntegerBitSet(26).initEmpty();
        for ("jx") |char| {
            bitset.set(char - 'a');
        }
        break :blk bitset;
    };

    const tens = comptime blk: {
        var bitset = std.bit_set.IntegerBitSet(26).initEmpty();
        for ("qz") |char| {
            bitset.set(char - 'a');
        }
        break :blk bitset;
    };

    const bitsets = .{ ones, twos, threes, fours, fives, eights, tens };
    const points = .{ 1, 2, 3, 4, 5, 8, 10 };

    var count: u8 = 0;

    for (s) |char| {
        const letter = std.ascii.toLower(char) - 'a';
        inline for (bitsets, points) |bitset, point| {
            if (bitset.isSet(letter)) count += point;
        }
    }
    return count;
}
