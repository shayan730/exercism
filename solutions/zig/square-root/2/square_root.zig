pub fn squareRoot(radicand: usize) usize {
    var l: usize = 0;
    var r: usize = radicand + 1;
    while (l != r - 1) {
        const m = (l + r) / 2;
        if (m * m <= radicand) {
            l = m;
        } else {
            r = m;
        }
    }
    return l;
}
