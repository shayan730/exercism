library(stringr)
parse_phone_number <- function(number_string) {
  res <- paste(
    unlist(
      str_extract_all(number_string, "[:digit:]+")
    ), collapse = ""
  )
  if (str_starts(res, "1")){
    res <- str_sub(res, 2, nchar(res))
  }
  if (nchar(res) == 10 && str_sub(res, 1, 1) > 1 && str_sub(res, 4, 4) > 1){
    res
  } else {
    NULL
  }
}
