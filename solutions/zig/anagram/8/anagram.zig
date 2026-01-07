const std = @import("std");
const mem = std.mem;

fn calculateFrequency(slice: []usize, string: []const u8) void {
    @memset(slice, 0); // LLM assisted!
    for (string) |c| {
        slice[std.ascii.toLower(c) - 'a'] += 1; // no input validation, not good!
    }
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

    var word_freq: [26]usize = undefined;
    calculateFrequency(&word_freq, word);

    for (candidates) |candidate| {
        if (candidate.len != word.len) continue;
        if (std.ascii.eqlIgnoreCase(candidate, word)) continue;

        var candidate_freq: [26]usize = undefined;
        calculateFrequency(&candidate_freq, candidate);
        if (std.mem.eql(usize, &word_freq, &candidate_freq)) {
            try bufset.insert(candidate);
        }
    }

    return bufset;
}
