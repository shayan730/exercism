LineUp :: {}.{
	format : Str, U64 -> Str
	format = |name, rank| {
        ordinal = match U64.mod_by(rank, 100) {
            11 | 12 | 13 => "th",
            _ => match U64.mod_by(rank, 10) {
                1 => "st",
                2 => "nd",
                3 => "rd",
                _ => "th",
            }
        }
        "${name}, you are the ${rank.to_str()}${ordinal} customer we serve today. Thank you!"
	}
}
