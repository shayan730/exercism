pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    if (number < 1) return ComputationError.IllegalArgument;
    const i = number;
    var count: usize = 0;
    if (i % 2 == 0) {
        return steps(i / 2);
    } else {
        return (i * 3 + 1);
    }
    count += 1;
}
