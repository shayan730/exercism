const std = @import("std");
pub fn isValidIsbn10(s: []const u8) bool {
    var sum: u64 = 0;
    var idx: u64 = 0;
    for (s) |ch| {
        switch (ch) {
            48...57 => {
                sum += (ch - '0') * (10 - idx);
                idx += 1;
            },
            88 => { //X
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
