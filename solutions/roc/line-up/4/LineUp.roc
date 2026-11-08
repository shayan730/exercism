LineUp :: {}.{
	format : Str, U64 -> Str
	format = |name, rank| {
        ordinal = match (U64.mod_by(rank, 100), U64.mod_by(rank, 10)) {
            (11, _) => "th",
            (12, _) => "th",
            (13, _) => "th",
            (_, 1) => "st",
            (_, 2) => "nd",
            (_, 3) => "rd",
            _ => "th",
            }
            "${name}, you are the ${rank.to_str()}${ordinal} customer we serve today. Thank you!"
        }
	}