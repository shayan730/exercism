const std = @import("std");

pub const Plant = enum { clover, grass, radishes, violets, invalid_plant_encoding };

fn getPlant(encoding: u8) Plant {
    switch (encoding) {
        'C' => return Plant.clover,
        'G' => return Plant.grass,
        'R' => return Plant.radishes,
        'V' => return Plant.violets,
        else => return Plant.invalid_plant_encoding,
    }
}

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    var planted: [4]Plant = undefined;
    var lines_iter = std.mem.tokenizeAny(u8, diagram, "\n");
    const student_idx = student[0] - 'A';
    var planted_idx: usize = 0;
    while (lines_iter.next()) |line| {
        planted[planted_idx] = getPlant(line[student_idx * 2]);
        planted_idx += 1;
        planted[planted_idx] = getPlant(line[student_idx * 2 + 1]);
        planted_idx += 1;
    }
    return planted;
}
