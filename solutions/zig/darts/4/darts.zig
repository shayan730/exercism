const std = @import("std");
pub const Coordinate = struct {
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return .{
            .x = x_coord,
            .y = y_coord,
        };
    }
    pub fn score(self: Coordinate) u4 {
        const distance2 = self.x * self.x + self.y * self.y;
        if (distance2 <= 1) return 10;
        if (distance2 <= 25) return 5;
        if (distance2 <= 100) return 1;
        return 0;
    }
};
