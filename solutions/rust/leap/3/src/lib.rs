pub fn is_leap_year(year: u64) -> bool {
    year & 0x3 == 0 && (year % 100 != 0 || year % 400 == 0)
}
