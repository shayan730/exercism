use std::collections::HashSet;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    // todo!("Sum the multiples of all of {factors:?} which are less than {limit}")
    let mut multiples = HashSet::new();
    for &f in factors {
        if f == 0 {
            continue;
        }
        multiples.extend((1..).map(|i| i * f).take_while(|&n| n < limit));
    }
    multiples.iter().sum()
}
