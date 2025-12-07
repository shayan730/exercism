/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    for (s[0..s.len], 0..) |character, index| {
        const reversed_index = s.len - index - 1;
        buffer[reversed_index] = character;
    }
    return buffer[0..s.len];
}
