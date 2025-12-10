pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    if (number < 1) return ComputationError.IllegalArgument;
    if (number <= 2) return 1;
    // const C = struct {
    var count: usize = 0;
    // };
    count += 1;
    if (number % 2 == 0) {
        return steps(number / 2);
    } else {
        return steps(number * 3 + 1);
    }
}
