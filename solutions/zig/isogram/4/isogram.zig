const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    // var chars: [26]bool = @splat(false);
    // var chars: [26]bool = .{false} ** 26;
    const letters = std.bit_set.IntegerBitSet(26);
    for (str) |char| {
        if (std.ascii.isAlphabetic(char)) {
            const letter = std.ascii.toLower(char) - 'a';
            if (isSet(letters, letter)) {
                return false;
            } else {
                letters.set(letter);
            }
        }
    }
    return true;
}
