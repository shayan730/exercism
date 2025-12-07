pub fn factors(n: u64) -> Vec<u64> {
    let mut prime_factors = Vec::<u64>::new();
    let mut dividend = n;

    while dividend % 2 == 0 {
        dividend /= 2;
        prime_factors.push(2);
    }

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
