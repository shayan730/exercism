pub fn nth(n: u32) -> u32 {
    let mut primes = vec![2_u32];
    let mut i: u32 = 3;
    while primes.len() as u32 <= n {
        // if primes.iter().all(|j| i % j != 0) {
        //     primes.push(i)
        // }
        let i_sqrt = i.isqrt();
        if primes
            .iter()
            .take_while(|j| **j <= i_sqrt)
            .all(|j| i % *j != 0)
        {
            primes.push(i)
        }
        i += 2;
    }
    *primes.last().unwrap()
}
