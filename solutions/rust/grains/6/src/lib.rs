pub fn square(s: u32) -> u128 {
    // todo!("grains of rice on square {s}");
    if s < 1 || s > 64 {
        panic!("Enter a value between 1 and 64!")
    } else {
        2_u128.pow(s - 1)
    }
}

pub fn total() -> u128 {
    // todo!();
    2_u128.pow(64) - 1
}
