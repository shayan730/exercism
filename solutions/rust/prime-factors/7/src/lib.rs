pub fn factors(n: u64) -> Vec<u64> {
    let trailing_zeros = n.trailing_zeros();
    let mut prime_factors = vec![2; trailing_zeros as usize];

    let mut dividend = n >> trailing_zeros;
    let mut divisor = 3;

    while dividend != 1 {
        if dividend % divisor == 0 {
            prime_factors.push(divisor);
            dividend /= divisor;
        } else {
            divisor += 2;
        }
    }

    prime_factors
}
