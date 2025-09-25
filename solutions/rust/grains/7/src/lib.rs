pub fn square(s: u32) -> u128 {
    match s {
        1..=64 => 2_u128.pow(s - 1),
        _ => panic!("Enter a valid number between 1 and 64"),
    }
}

pub fn total() -> u128 {
    2_u128.pow(64) - 1
}
