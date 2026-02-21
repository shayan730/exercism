const std = @import("std");
pub fn recite(buffer: []u8, start_bottles: u32, take_down: u32) ![]const u8 {
    const numbers_camel = [_][]const u8{ "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten" };
    const numbers_lower = [_][]const u8{ "no", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten" };

    const verse_template =
        \\{s} green {s} hanging on the wall,
        \\{s} green {s} hanging on the wall,
        \\And if one green bottle should accidentally fall,
        \\There'll be {s} green {s} hanging on the wall.
        \\
        \\
    ;
    var offset: usize = 0;
    for (0..take_down) |take| {
        const current_idx: usize = start_bottles - take;
        const next_idx: usize = start_bottles - take - 1;
        const current = numbers_camel[current_idx];
        const next = numbers_lower[next_idx];
        const curr_bottle_or_bottles: []const u8 = if (current_idx == 1) "bottle" else "bottles";
        const next_bottle_or_bottles: []const u8 = if (next_idx == 1) "bottle" else "bottles";
        const written =
            try std.fmt.bufPrint(buffer[offset..], verse_template, .{ current, curr_bottle_or_bottles, current, curr_bottle_or_bottles, next, next_bottle_or_bottles });
        offset += written.len;
    }
    return buffer[0 .. offset - 2];
}
