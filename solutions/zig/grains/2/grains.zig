pub const ChessboardError = error{IndexOutOfBounds};

pub fn square(index: usize) ChessboardError!u64 {
    if (index < 1 or index > 64) return ChessboardError.IndexOutOfBounds;
    return index - 1 >> 1;
}

pub fn total() ChessboardError!u64 {
    var result: u64 = 0;
    for (1..64 + 1) |idx| {
        result += square(idx) catch |err| return err;
    }
    return result;
}
