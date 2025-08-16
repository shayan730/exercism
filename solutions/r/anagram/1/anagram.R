library(tidyverse)

anagram <- function(subject, candidates) {
  res <- c()
  subject <- str_to_lower(subject)
  for (cand in candidates){
    cand_lower <- str_to_lower(cand)
    vec <- c()
    for (i in str_split(subject, "")){
      vec <- c(vec, (str_count(subject, i) == str_count(cand_lower, i)))
    }
    for (i in str_split(cand_lower, "")){
      vec <- c(vec, (str_count(cand_lower, i) == str_count(subject, i)))
    }
    if (all(vec) && subject != cand_lower){
      res <- c(res, cand)
    }}
  res
}
