pub fn isLeapYear(year: u32) bool {
    // _ = year;
    // @compileError("please implement the isLeapYear function");
    if (year % 4 == 0) {
        return !(year % 100 == 0 and year % 400 != 0);
    }
    return false;
}
