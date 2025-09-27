pub fn is_leap_year(year: u64) -> bool {
    match year {
        n if n % 4 == 0 && n % 100 != 0 => true,
        n if n % 400 == 0 => true,
        _ => false,
    }
}
