const std = @import("std");
pub fn convert(buffer: []u8, n: u32) []const u8 {
    var stream = std.Io.Writer.fixed(buffer);
    if (n % 3 == 0) stream.writeAll("Pling") catch unreachable;
    if (n % 5 == 0) stream.writeAll("Plang") catch unreachable;
    if (n % 7 == 0) stream.writeAll("Plong") catch unreachable;
    if (stream.end == 0) stream.print("{d}", .{n}) catch unreachable;

    return stream.buffered();
}
