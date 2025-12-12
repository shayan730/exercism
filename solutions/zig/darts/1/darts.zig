const std = @import("std");
pub const Coordinate = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return .{
            .x = x_coord,
            .y = y_coord,
        };
    }
    pub fn score(self: Coordinate) usize {
        const distance = @sqrt(std.math.pow(f32, self.x, 2) + std.math.pow(f32, self.y, 2));
        if (distance <= 1) return 10;
        if (distance <= 5) return 5;
        if (distance <= 10) return 1;
        return 0;
    }
};
