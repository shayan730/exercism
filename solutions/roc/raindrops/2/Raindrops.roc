Raindrops :: {}.{
	convert : U64 -> Str
    convert = |number| {
        var $sound = ""
        if number |> U64.mod_by(3) == 0 {
            $sound = $sound.concat("Pling")
        }
        if number |> U64.mod_by(5) == 0 {
            $sound = $sound.concat("Plang")
        }
        if number |> U64.mod_by(7) == 0 {
            $sound = $sound.concat("Plong")
        }
        if $sound |> Str.is_empty() {
            $sound = number.to_str()
        }
        $sound
    }
}
