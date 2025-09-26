pub fn nth(n: u32) -> u32 {
    // todo!("What is the 0-indexed {n}th prime number?")
    let mut primes = Vec::<u32>::new();
    primes.push(2);
    let mut i = 3;
    let mut is_prime: bool = true;
    while (primes.len() as u32) < n {
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
