pub fn square(s: u32) -> u64 {
    match s {
        // 1..=64 => 2_u64.pow(s - 1),
        1..=64 => 1 << s - 1,
        _ => panic!("Enter a valid number between 1 and 64"),
    }
}

pub fn total() -> u64 {
    // u64::MAX
    // !0u64
    // 0xffffffffffffffff
    (1_u64 << 63) + ((1_u64 << 63) - 1)
}
