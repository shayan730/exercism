pub fn eggCount(number: u32) u32 {
    var n_ones: u32 = 0;
    var num = number;
    while (num > 0) : (num = num >> 1) {
        n_ones += num & 1;
    }
    return n_ones;
}
