const std = @import("std");
pub fn isValidIsbn10(s: []const u8) bool {
    var sum: u16 = 0;
    var idx: u16 = 0;
    for (s) |ch| {
        switch (ch) {
            '0'...'9' => {
                sum += (ch - '0') * (10 - idx);
                idx += 1;
            },
            'X' => {
                sum += 10;
                idx += 1;
                break;
            },
            '-' => continue,
            else => return false,
        }
    }
    return sum != 0 and idx == 10 and sum % 11 == 0;
}
