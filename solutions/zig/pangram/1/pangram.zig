const std = @import("std");
pub fn isPangram(str: []const u8) bool {
    for (0..26) |char_idx| {
        if (std.mem.indexOfScalar(u8, str, std.ascii.lowercase[char_idx]) == null and std.mem.indexOfScalar(u8, str, std.ascii.uppercase[char_idx]) == null) return false;
    }
    return true;
}
