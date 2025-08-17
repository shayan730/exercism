use std::collections::HashMap;

pub fn recite(start_bottles: u32, take_down: u32) -> String {
    let mut mappings = HashMap::new();
    mappings.insert(0, "no");
    mappings.insert(1, "One");
    mappings.insert(2, "Two");
    mappings.insert(3, "Three");
    mappings.insert(4, "Four");
    mappings.insert(5, "Five");
    mappings.insert(6, "Six");
    mappings.insert(7, "Seven");
    mappings.insert(8, "Eight");
    mappings.insert(9, "Nine");
    mappings.insert(10, "Ten");

    let mut result = String::new();

    for i in 0..take_down {
        let remaining_before = match mappings.get(&(start_bottles - i)) {
                Some(val) => val,
                None => "",
            };
        let remaining_after = match mappings.get(&(start_bottles - i - 1)) {
                Some(val) => val.to_lowercase(),
                None => "".to_string(),
            };
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
        if i != take_down - 1 {
            result.push_str("\n\n");
        }
    }
    result
}
