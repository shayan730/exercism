pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var res: Counts = .{ .a = 0, .c = 0, .g = 0, .t = 0 };
    // ideally provide safety checks for s 
    // or document illegal behavior
    for (s) |ch| {
        if (ch == 'A') {
            res.a += 1;
        } else if (ch == 'C') {
            res.c += 1;
        } else if (ch == 'G') {
            res.g += 1;
        } else if (ch == 'T') {
            res.t += 1;
        } else {
            return NucleotideError.Invalid;
        }
    }
    return res;
}
