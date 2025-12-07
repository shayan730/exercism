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
        const factor: f32 = switch (self) {
            Planet.mercury => 0.2_408_467,
            Planet.venus => 0.61_519_726,
            Planet.mars => 1.8_808_158,
            Planet.jupiter => 11.862_615,
            Planet.saturn => 29.447498,
            Planet.uranus => 84.016846,
            Planet.neptune => 164.79132,
            Planet.earth => 1,
        };
        return @as(f32, @floatFromInt(seconds)) / factor / 31_557_600.0;
    }
};
