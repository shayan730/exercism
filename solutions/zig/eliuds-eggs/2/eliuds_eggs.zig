pub fn eggCount(number: usize) usize {
    var n_ones: u8 = 0;
    var num = number;
    while (num > 0) : (num = num >> 1) {
        if (num & 1 == 1) n_ones += 1;
    }
    return n_ones;
}
