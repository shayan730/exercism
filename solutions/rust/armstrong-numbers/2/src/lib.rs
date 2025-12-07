pub fn is_armstrong_number(num: u32) -> bool {
    let n = num.to_string().len() as u32;
    let sum_num = num.to_string()
    .chars()
    .fold(0, |acc, x| (x.to_digit(10).unwrap()).pow(n) + acc);
    num == sum_num
}
