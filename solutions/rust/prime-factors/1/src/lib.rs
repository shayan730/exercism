pub fn factors(n: u64) -> Vec<u64> {
    let mut prime_factors = Vec::<u64>::new();
    let mut divisor = 2;
    let mut dividend = n;
    let n_sqrt = (n as f64).sqrt() as u64;
    while dividend != 1 {
        if dividend % divisor == 0 {
            prime_factors.push(divisor);
            dividend = dividend / divisor;
        } else {
            divisor += 1;
        }
    }
    prime_factors
}
