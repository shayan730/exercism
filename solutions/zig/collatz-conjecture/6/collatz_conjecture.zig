pub const ComputationError = error{IllegalArgument};
pub fn steps(number: usize) anyerror!usize {
    if (number < 1) return ComputationError.IllegalArgument;
    var i = number;
    var count: usize = 0;
    while (i != 1) {
        if (i & 1 == 0) {
            i = i >> 1;
        } else {
            i = i * 3 + 1;
        }
        count += 1;
    }
    return count;
}
