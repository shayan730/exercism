pub fn nth(n: u32) -> u32 {
    // todo!("What is the 0-indexed {n}th prime number?")
    let mut primes = Vec::<u32>::new();
    let mut i = 2;
    let mut is_prime = true;
    while primes.len() as u32 + 1 < n {
        for j in (2..i).rev() {
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
