pub fn recite(start_bottles: u32, take_down: u32) -> String {
    let mappings = ["no", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"];
    let start_bottles = start_bottles as usize;
    let mut result = String::new();

    for i in 0_usize..take_down as usize {
        let remaining_before = mappings[start_bottles - i];
        let remaining_after = mappings[start_bottles - i - 1].to_lowercase();
        let verse = format!(
            "{} green {} hanging on the wall,\n\
            {} green {} hanging on the wall,\n\
            And if one green bottle should accidentally fall,\n\
            There'll be {} green {} hanging on the wall.",
            remaining_before,
            if start_bottles - i == 1  {"bottle"} else {"bottles"},
            remaining_before,
            if start_bottles - i == 1  {"bottle"} else {"bottles"},
            remaining_after,
            if start_bottles - i - 1 == 1  {"bottle"} else {"bottles"},
        );
        result.push_str(&verse);
        if i != take_down as usize - 1 {
            result.push_str("\n\n");
        }
    }
    result
}
