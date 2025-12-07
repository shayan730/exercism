const denom = 31_557_600.0;
const factors: [8]f32 = .{
    0.2_408_467 * denom,
    0.61_519_726 * denom,
    1.8_808_158 * denom,
    11.862_615 * denom,
    29.447498 * denom,
    84.016846 * denom,
    164.79132 * denom,
    1.0 * denom,
};
pub const Planet = enum {
    mercury,
    venus,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,
    earth,

    pub fn age(self: Planet, seconds: usize) f64 {
        const factor: f32 = factors[@intFromEnum(self)];
        return @as(f32, @floatFromInt(seconds)) / factor;
    }
};
