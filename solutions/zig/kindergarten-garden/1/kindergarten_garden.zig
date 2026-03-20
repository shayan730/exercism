const std = @import("std");

pub const Plant = enum {
    clover,
    grass,
    radishes,
    violets,
};

const students = [_][]const u8{ "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry" };

fn getPlan(encoding: u8) Plant {
    switch (encoding) {
        'C' => return Plant.clover,
        'G' => return Plant.grass,
        'R' => return Plant.radishes,
        'V' => return Plant.violets,
        else => unreachable,
    }
}

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    var planted: [4]Plant = undefined;
    var lines_iter = std.mem.tokenizeAny(u8, diagram, "\n");
    var student_idx: usize = 0;
    for (students) |s| {
        if (std.mem.eql(u8, s, student)) break;
        student_idx += 1;
    }
    var planted_idx: usize = 0;
    while (lines_iter.next()) |line| {
        planted[planted_idx] = getPlan(line[student_idx * 2]);
        planted_idx += 1;
        planted[planted_idx] = getPlan(line[student_idx * 2 + 1]);
        planted_idx += 1;
    }
    return planted;
}
