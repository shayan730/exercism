LineUp :: {}.{
	format : Str, U64 -> Str
	format = |name, rank| {
        last_digit = U64.mod_by(rank, 10)
        ordinal = if last_digit > 3 or last_digit == 0 or U64.mod_by(rank / 10, 10) == 1 {
            "th"
        } else if last_digit == 1 {
            "st"
        } else if last_digit == 2 {
            "nd"
        } else {
            "rd"
        }
        "${name}, you are the ${rank.to_str()}${ordinal} customer we serve today. Thank you!"
	}
}
