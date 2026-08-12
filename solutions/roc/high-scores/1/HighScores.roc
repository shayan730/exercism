HighScores :: {}.{
	latest : List(U64) -> Try(U64, _)
	latest = |scores| {
		scores.take_last(1)
        .get(0)
	}

	personal_best : List(U64) -> Try(U64, _)
	personal_best = |scores| {
        scores.max()
	}

	personal_top_three : List(U64) -> List(U64)
	personal_top_three = |scores| {
        scores.sort_with(|a, b| if a > b LT else if a < b GT else EQ)
        .take_first(3)
	}
}
