# This is a stub function to take two strings
# and calculate the hamming distance
hamming <- function(strand1, strand2) {
  if (nchar(strand1) == nchar(strand2)){
    diff = 0
    for (i in 1:nchar(strand1)){
      if (substring(strand1, i, i) != substring(strand2, i, i)){
        diff <- diff + 1
      }
    }
  diff
  } else {
  stop()
  } 
}
