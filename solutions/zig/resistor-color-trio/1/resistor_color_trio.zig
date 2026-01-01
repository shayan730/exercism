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
    const tens: f64 = @floatFromInt(@intFromEnum(colors[0]) * 10 + @intFromEnum(colors[1]));
    const num_zeros = @intFromEnum(colors[2]);
    const exp: f64 = @floatFromInt(num_zeros);
    switch (num_zeros + 2) {
        0...3 => {
            const num = tens * std.math.pow(f64, 10, exp);
            const result = try std.fmt.allocPrint(allocator, "{d} ohms", .{num});
            return result;
        },
        4...6 => {
            const num = tens * std.math.pow(f64, 10, exp) / 1_000;
            const result = try std.fmt.allocPrint(allocator, "{d} kiloohms", .{num});
            return result;
        },
        7...9 => {
            const num = tens * std.math.pow(f64, 10, exp) / 1_000_000;
            const result = try std.fmt.allocPrint(allocator, "{d} megaohms", .{num});
            return result;
        },
        10...12 => {
            const num = tens * std.math.pow(f64, 10, exp) / 1_000_000_000;
            const result = try std.fmt.allocPrint(allocator, "{d} gigaohms", .{num});
            return result;
        },
        else => unreachable,
    }
}
