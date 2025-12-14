const std = @import("std");
pub const ChessboardError = error{IndexOutOfBounds};

pub fn square(index: usize) ChessboardError!u64 {
    if (index < 1 or index > 64) return ChessboardError.IndexOutOfBounds;
    return std.math.pow(u64, 2, index - 1);
}

pub fn total() ChessboardError!u64 {
    var result: u64 = 0;
    for (1..64 + 1) |idx| {
        result += square(idx) catch |err| return err;
    }
    return result;
}
