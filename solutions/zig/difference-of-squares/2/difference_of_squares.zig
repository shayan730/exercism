pub fn squareOfSum(number: u64) u64 {
    var total: u64 = 0;
    for (0..number + 1) |i| {
        total += i;
    }
    return total * total;
}

pub fn sumOfSquares(number: u64) u64 {
    var total: u64 = 0;
    for (0..number + 1) |i| {
        total += i * i;
    }
    return total;
}

pub fn differenceOfSquares(number: u64) u64 {
    return squareOfSum(number) - sumOfSquares(number);
}
