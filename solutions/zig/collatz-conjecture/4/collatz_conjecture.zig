pub const ComputationError = error{IllegalArgument};

const C = struct {
    var count: usize = 0;
};

pub fn steps(number: usize) anyerror!usize {
    if (number == 0) return ComputationError.IllegalArgument;
    if (number == 1) {
        const result = C.count;
        C.count = 0;
        return result;
    }
    C.count += 1;
    if (number & 1 == 0) {
        return steps(number / 2);
    } else {
        return steps(number * 3 + 1);
    }
}
