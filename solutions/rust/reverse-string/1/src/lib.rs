pub fn reverse(input: &str) -> String {
    // todo!("Write a function to reverse {input}");
    let mut s: String = String::from("");
    for letter in input.chars().rev() {
        s.push(letter)
    };
    s
}
