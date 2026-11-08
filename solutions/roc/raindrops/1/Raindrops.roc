Raindrops :: {}.{
	convert : U64 -> Str
    convert = |number| {
        var $sound = ""
        if number % 3 == 0 {
            $sound = $sound.concat("Pling")
        }
        if number % 5 == 0 {
            $sound = $sound.concat("Plang")
        }
        if number % 7 == 0 {
            $sound = $sound.concat("Plong")
        }
        if $sound.is_empty() {
            $sound = number.to_str()
        }
        $sound
    }
}
