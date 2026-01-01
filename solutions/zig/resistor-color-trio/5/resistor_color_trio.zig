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
    const tens = @intFromEnum(colors[0]) * 10 + @intFromEnum(colors[1]);
    const resistance: f64 = @floatFromInt(tens * std.math.pow(u64, 10, num_zeros));
    if (resistance < 1000) {
        return try std.fmt.allocPrint(allocator, "{} ohms", .{resistance});
    } else if (resistance < 1_000_000) {
        return try std.fmt.allocPrint(allocator, "{} kiloohms", .{resistance / 1_000});
    } else if (resistance < 1_000_000_000) {
        return try std.fmt.allocPrint(allocator, "{} megaohms", .{resistance / 1_000_000});
    } else if (resistance < 1_000_000_000_000) {
        return try std.fmt.allocPrint(allocator, "{} gigaohms", .{resistance / 1_000_000_000});
    }
    unreachable;
}
