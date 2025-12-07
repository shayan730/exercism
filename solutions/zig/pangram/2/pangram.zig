const std = @import("std");
pub fn isPangram(str: []const u8) bool {
    var letters: @Vector(26, bool) = @splat(false);
    for (str) |char| {
        if (std.ascii.isAlphabetic(char)) {
            const lower_char = std.ascii.toLower(char);
            letters[lower_char - 'a'] = true;
        }
    }
    return @reduce(.And, letters);
}
