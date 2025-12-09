const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    // var acronym = try allocator.alloc(u8, words.len);
    // var pos: usize = 0;
    // acronym[pos] = std.ascii.toUpper(words[0]);
    // pos += 1;
    // for (words, 0..) |char, idx| {
    //     if (char == ' ' or char == '-') {
    //         if (std.ascii.isAlphabetic(words[idx + 1])) {
    //             acronym[pos] = std.ascii.toUpper(words[idx + 1]);
    //             pos += 1;
    //         }
    //     }
    // }
    // return allocator.realloc(acronym, pos);
    var list: std.ArrayList(u8) = .empty;
    var iter = std.mem.tokenizeAny(u8, words, " -_");
    while (iter.next()) |word| {
        try list.append(allocator, std.ascii.toUpper(word[0]));
    }
    return list.toOwnedSlice(allocator);
}
