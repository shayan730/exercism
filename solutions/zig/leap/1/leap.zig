pub fn isLeapYear(year: u32) bool {
    return ((year % 4 == 0) & ((year % 100 != 0) | (year % 400 == 0)));
}
