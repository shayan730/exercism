const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    // var chars: [26]bool = @splat(false);
    var chars: @Vector(26, bool) = .{false} ** 26;
    for (str) |char| {
        if (std.ascii.isAlphabetic(char)) {
            const char_lwr = std.ascii.toLower(char) - 'a';
            if (chars[char_lwr]) {
                return false;
            } else {
                chars[char_lwr] = true;
            }
        }
    }
    return true;
}
