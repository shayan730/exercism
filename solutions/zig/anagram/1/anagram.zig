const std = @import("std");
const mem = std.mem;

fn lessThan(_: void, lhs: u8, rhs: u8) bool {
    return lhs < rhs;
}

fn sortStringSlice(slice: []u8) void {
    std.mem.sort(u8, slice, {}, lessThan);
}

/// Returns the set of strings in `candidates` that are anagrams of `word`.
/// Caller owns the returned memory.
pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var bufset = std.BufSet.init(allocator);

    // Copy and sort the word
    const word_cp = try allocator.alloc(u8, word.len);
    defer allocator.free(word_cp);
    std.mem.copyForwards(u8, word_cp, word);
    sortStringSlice(word_cp);

    // Find the max length of candidates to reuse the buffer
    var max_len: usize = 0;
    for (candidates) |candidate| {
        if (candidate.len > max_len) max_len = candidate.len;
    }
    const temp_buf = try allocator.alloc(u8, max_len);
    defer allocator.free(temp_buf);

    // Check each candidate
    for (candidates) |candidate| {
        if (candidate.len != word.len) continue; // different length → can't be an anagram
        std.mem.copyForwards(u8, temp_buf[0..candidate.len], candidate);
        sortStringSlice(temp_buf[0..candidate.len]);
        if (std.mem.eql(u8, word_cp, temp_buf[0..candidate.len])) {
            try bufset.insert(candidate);
        }
    }

    return bufset;
}
