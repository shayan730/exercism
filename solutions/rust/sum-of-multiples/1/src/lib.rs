pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    // todo!("Sum the multiples of all of {factors:?} which are less than {limit}")
    let mut all_multiples = Vec::new();
    for f in factors {
        for i in 1..limit {
            let multiple = i * f;
            if multiple >= limit {
                break;
            } else {
                if !all_multiples.contains(&multiple) {
                    all_multiples.push(multiple);
                }
            }
        }
    }
    all_multiples.iter().sum()
}
