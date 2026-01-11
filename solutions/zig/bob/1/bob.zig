const std = @import("std");

fn isAllUpper(s: []const u8) bool {
    var no_letters: usize = 0;
    var no_upper_letters: usize = 0;
    for (s) |c| {
        if (std.ascii.isAlphabetic(c)) no_letters += 1;
        if (std.ascii.isUpper(c)) no_upper_letters += 1;
    }
    if (no_letters > 0 and no_upper_letters == no_letters) return true;
    return false;
}

fn hasAlphanumeric(s: []const u8) bool {
    for (s) |c| {
        if (std.ascii.isAlphanumeric(c)) return true;
    }
    return false;
}

pub fn response(string: []const u8) []const u8 {
    const s: []const u8 = std.mem.trim(u8, string, " ");
    if (std.mem.endsWith(u8, s, "?")) {
        if (isAllUpper(s)) return "Calm down, I know what I'm doing!";
        return "Sure.";
    }

    if (!hasAlphanumeric(s)) return "Fine. Be that way!";

    if (isAllUpper(s)) return "Whoa, chill out!";

    return "Whatever.";
}
