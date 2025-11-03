/// Possible error that can occur when counting nucleotides.
pub const NucleotideError = error{
    /// Indicates that the input contains a character other than
    /// 'A', 'C', 'G', or 'T'.
    Invalid,
};

/// Holds the count of each nucleotide in a DNA sequence.
/// Each field corresponds to one of the four standard DNA bases.
pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

/// Counts the number of each nucleotide in the given DNA sequence.
/// Iterates through the input slice and tallies occurrences of
/// 'A', 'C', 'G', and 'T'. If the input contains any invalid
/// characters, returns `NucleotideError.Invalid`.
///
/// # Parameters
/// - `input`: The DNA sequence as a UTF-8 byte slice.
///
/// # Returns
/// - On success: A `Counts` struct containing the tallies.
/// - On error: `NucleotideError.Invalid` if an unexpected character is found.
pub fn countNucleotides(input: []const u8) NucleotideError!Counts {
    // ideally provide safety checks for `input` 
    // or document illegal behavior
    var counts: Counts = .{ .a = 0, .c = 0, .g = 0, .t = 0 };
    for (input) |char| {
        switch (char) {
            'A' => counts.a += 1,
            'C' => counts.c += 1,
            'G' => counts.g += 1,
            'T' => counts.t += 1,
            else => return NucleotideError.Invalid,
        }
    }
    return counts;
}
