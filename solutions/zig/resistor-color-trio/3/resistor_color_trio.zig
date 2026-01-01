const std = @import("std");
const mem = std.mem;

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

pub fn label(allocator: mem.Allocator, colors: []const ColorBand) mem.Allocator.Error![]u8 {
    const num_zeros = @intFromEnum(colors[2]);
    const exp: f64 = @floatFromInt(num_zeros);
    const tens: f64 = @floatFromInt(@intFromEnum(colors[0]) * 10 + @intFromEnum(colors[1]));
    const resistance = tens * std.math.pow(f64, 10, exp);
    switch (num_zeros + 2) {
        0...3 => {
            return try std.fmt.allocPrint(allocator, "{d} ohms", .{resistance});
        },
        4...6 => {
            return try std.fmt.allocPrint(allocator, "{d} kiloohms", .{resistance / 1_000});
        },
        7...9 => {
            return try std.fmt.allocPrint(allocator, "{d} megaohms", .{resistance / 1_000_000});
        },
        10...12 => {
            return try std.fmt.allocPrint(allocator, "{d} gigaohms", .{resistance / 1_000_000_000});
        },
        else => unreachable,
    }
}
