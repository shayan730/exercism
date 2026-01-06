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
    errdefer bufset.deinit();

    const word_lower = try allocator.alloc(u8, word.len);
    defer allocator.free(word_lower);
    std.mem.copyForwards(u8, word_lower, word);
    for (word_lower) |*c| {
        c.* = std.ascii.toLower(c.*);
    }
    const word_sorted = try allocator.alloc(u8, word.len);
    defer allocator.free(word_sorted);
    std.mem.copyForwards(u8, word_sorted, word_lower);
    sortStringSlice(word_sorted);

    var max_len: usize = 0;
    for (candidates) |candidate| {
        if (candidate.len > max_len) max_len = candidate.len;
    }
    const temp_buf = try allocator.alloc(u8, max_len);
    defer allocator.free(temp_buf);

    for (candidates) |candidate| {
        if (candidate.len != word.len) continue;
        std.mem.copyForwards(u8, temp_buf[0..candidate.len], candidate);
        for (temp_buf[0..candidate.len]) |*c| {
            c.* = std.ascii.toLower(c.*);
        }
        if (std.mem.eql(u8, word_lower, temp_buf[0..candidate.len])) continue;
        sortStringSlice(temp_buf[0..candidate.len]);
        if (std.mem.eql(u8, word_sorted, temp_buf[0..candidate.len])) {
            try bufset.insert(candidate);
        }
    }

    return bufset;
}
