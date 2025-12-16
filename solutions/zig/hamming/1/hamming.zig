pub const DnaError = error{
    EmptyDnaStrands,
    UnequalDnaStrands,
};
pub fn compute(first: []const u8, second: []const u8) DnaError!usize {
    var total_difference: usize = 0;
    const len1 = first.len;
    const len2 = second.len;
    if (len1 == 0 or len2 == 0) return DnaError.EmptyDnaStrands;
    if (len1 != len2) return DnaError.UnequalDnaStrands;
    for (first, second) |char1, char2| {
        total_difference += @intFromBool(char1 != char2);
    }
    return total_difference;
}
