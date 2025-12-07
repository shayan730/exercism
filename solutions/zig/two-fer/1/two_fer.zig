pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    var idx: usize = 0;
    for ("One for ") |char| {
        buffer[idx] = char;
        idx += 1;
    }
    const who = name orelse "you";
    for (who) |char| {
        buffer[idx] = char;
        idx += 1;
    }
    for (", one for me.") |char| {
        buffer[idx] = char;
        idx += 1;
    }
    return buffer[0..idx];
}
