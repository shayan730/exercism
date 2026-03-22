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
    const student_idx = student[0] - 'A'; // taking advantage of student names being in alphabetical order
    const line_two_start_idx = diagram.len / 2 + 1; // lines are of equal length plus '\n'
    planted[0] = getPlant(diagram[student_idx * 2]);
    planted[1] = getPlant(diagram[student_idx * 2 + 1]);
    planted[2] = getPlant(diagram[line_two_start_idx + student_idx * 2]);
    planted[3] = getPlant(diagram[line_two_start_idx + student_idx * 2 + 1]);
    return planted;
}
