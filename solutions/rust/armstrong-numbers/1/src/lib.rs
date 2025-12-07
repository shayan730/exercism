pub fn is_armstrong_number(num: u32) -> bool {
    let mut sum_num: u32 = 0;
    let num_str = num.to_string();
    let n = num_str.len() as u32;
    for i in num_str.chars(){
        let i_num: u32 = i.to_digit(10).unwrap();
        sum_num += i_num.pow(n);
        println!("{}", sum_num);
    }
    num == sum_num
}
