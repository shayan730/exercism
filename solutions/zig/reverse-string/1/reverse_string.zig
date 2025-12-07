/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    var index: u8 = 0;
    while (index < s.len) : (index += 1) {
        buffer[index] = s[s.len - index - 1];
    }
    return buffer[0..s.len];
}
