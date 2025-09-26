pub fn nth(n: u32) -> u32 {
    let mut primes = Vec::<u32>::new();
    primes.push(2);
    let mut i = 3;
    while (primes.len() as u32) <= n {
        let i_sqrt = (i as f32).sqrt() as u32;
        let mut is_prime: bool = true;
        for j in 3..=i_sqrt {
            if i % j == 0 {
                is_prime = false;
                break;
            };
        }
        if is_prime {
            primes.push(i);
        };
        i += 2;
    }
    *primes.last().unwrap()
}
