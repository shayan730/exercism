const std = @import("std");
const mem = std.mem;

fn calculateFrequency(string: []const u8) [26]usize {
    var word_freq: [26]usize = @splat(0);
    for (string) |c| {
        word_freq[std.ascii.toLower(c) - 'a'] += 1; // ideally raise an error if not a valid input
    }
    return word_freq;
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

    const word_freq = calculateFrequency(word);

    for (candidates) |candidate| {
        if (std.ascii.eqlIgnoreCase(candidate, word)) continue;

        const candidate_freq = calculateFrequency(candidate);
        if (std.mem.eql(usize, &word_freq, &candidate_freq)) {
            try bufset.insert(candidate);
        }
    }

    return bufset;
}
