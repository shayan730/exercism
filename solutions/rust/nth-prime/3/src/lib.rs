pub fn nth(n: u32) -> u32 {
    let mut primes = Vec::<u32>::new();
    let mut i = 2;
    let mut is_prime: bool = true;
    while primes.len() as u32 + 1 <= n {
        for j in (2..i).rev() {
            is_prime = true;
            if i % j == 0 {
                is_prime = false;
                break;
            };
        }
        if is_prime {
            primes.push(i);
        };
        i += 1;
    }
    *primes.last().unwrap()
}
