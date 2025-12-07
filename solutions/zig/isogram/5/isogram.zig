const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    // var chars: [26]bool = @splat(false);
    // var chars: [26]bool = .{false} ** 26;
    var letters = std.bit_set.IntegerBitSet(26).initEmpty();
    for (str) |char| {
        if (std.ascii.isAlphabetic(char)) {
            const letter_idx = std.ascii.toLower(char) - 'a';
            if (letters.isSet(letter_idx)) {
                return false;
            } else {
                letters.set(letter_idx);
            }
        }
    }
    return true;
}
