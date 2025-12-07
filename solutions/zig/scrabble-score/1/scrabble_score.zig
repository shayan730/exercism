const std = @import("std");
pub fn score(s: []const u8) u32 {
    var ones: std.bit_set.IntegerBitSet(26) = std.bit_set.IntegerBitSet(26).initEmpty();
    for ("aeioulnrst") |char| {
        ones.set(char - 'a');
    }

    var twos: std.bit_set.IntegerBitSet(26) = std.bit_set.IntegerBitSet(26).initEmpty();
    for ("dg") |char| {
        twos.set(char - 'a');
    }

    var threes: std.bit_set.IntegerBitSet(26) = std.bit_set.IntegerBitSet(26).initEmpty();
    for ("bcmp") |char| {
        threes.set(char - 'a');
    }

    var fours: std.bit_set.IntegerBitSet(26) = std.bit_set.IntegerBitSet(26).initEmpty();
    for ("fhvwy") |char| {
        fours.set(char - 'a');
    }

    var fives: std.bit_set.IntegerBitSet(26) = std.bit_set.IntegerBitSet(26).initEmpty();
    for ("k") |char| {
        fives.set(char - 'a');
    }

    var eights: std.bit_set.IntegerBitSet(26) = std.bit_set.IntegerBitSet(26).initEmpty();
    for ("jx") |char| {
        eights.set(char - 'a');
    }

    var tens: std.bit_set.IntegerBitSet(26) = std.bit_set.IntegerBitSet(26).initEmpty();
    for ("qz") |char| {
        tens.set(char - 'a');
    }

    var count: u8 = 0;
    for (s) |char| {
        if (ones.isSet(std.ascii.toLower(char) - 'a')) count += 1;
        if (twos.isSet(std.ascii.toLower(char) - 'a')) count += 2;
        if (threes.isSet(std.ascii.toLower(char) - 'a')) count += 3;
        if (fours.isSet(std.ascii.toLower(char) - 'a')) count += 4;
        if (fives.isSet(std.ascii.toLower(char) - 'a')) count += 5;
        if (eights.isSet(std.ascii.toLower(char) - 'a')) count += 8;
        if (tens.isSet(std.ascii.toLower(char) - 'a')) count += 10;
    }
    return count;
}
