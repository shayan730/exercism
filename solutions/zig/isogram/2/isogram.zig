const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var tracker: [128]bool = @splat(false);
    for (str) |ch| {
        const ch_lwr = std.ascii.toLower(ch);
        if (tracker[ch_lwr]) return false;
        if (ch_lwr != ' ' and ch_lwr != '-') tracker[ch_lwr] = true;
    }
    return true;
}
