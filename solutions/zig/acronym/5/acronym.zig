const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var acronym = try allocator.alloc(u8, words.len);
    var pos: usize = 0;
    acronym[pos] = std.ascii.toUpper(words[0]);
    errdefer {
        allocator.free(acronym);
    }
    pos += 1;
    for (0..words.len - 1) |idx| {
        if (words[idx] == ' ' or words[idx] == '-' or words[idx] == '_') {
            if (std.ascii.isAlphabetic(words[idx + 1])) {
                acronym[pos] = std.ascii.toUpper(words[idx + 1]);
                pos += 1;
            }
        }
    }
    const resized = allocator.realloc(acronym, pos);
    return resized;
}
