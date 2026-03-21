const std = @import("std");

pub const Plant = enum {
    clover,
    grass,
    radishes,
    violets,
};

const Students = enum { Alice, Bob, Charlie, David, Eve, Fred, Ginny, Harriet, Ileana, Joseph, Kincaid, Larry };

fn getPlant(encoding: u8) Plant {
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
    const student_idx: usize = @intFromEnum(std.meta.stringToEnum(Students, student).?);
    var planted_idx: usize = 0;
    while (lines_iter.next()) |line| {
        planted[planted_idx] = getPlant(line[student_idx * 2]);
        planted_idx += 1;
        planted[planted_idx] = getPlant(line[student_idx * 2 + 1]);
        planted_idx += 1;
    }
    return planted;
}
