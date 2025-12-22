pub const ColorBand = enum(usize) {
    black,
    brown,
    red,
    orange,
    yellow,
    green,
    blue,
    violet,
    grey,
    white,
};

pub fn colorCode(colors: [2]ColorBand) usize {
    var arr: [2]usize = undefined;
    for (colors, 0..) |color, idx| {
        arr[idx] = @intFromEnum(color);
    }
    return arr[0] * 10 + arr[1];
}
