pub fn isLeapYear(year: u32) bool {
    return (year & 0x3 == 0 and (year % 100 != 0 or year % 400 == 0));
}
