pub fn factors(n: u64) -> Vec<u64> {
    let mut prime_factors = Vec::<u64>::new();
    let mut divisor = 2;
    let mut dividend = n;
    while dividend != 1 {
        if dividend % divisor == 0 {
            prime_factors.push(divisor);
            dividend /= divisor;
        } else {
            divisor += 1;
        }
    }
    prime_factors
}
