#include "hamming.h"
#include <stddef.h>
// #include <string.h>

int compute(const char *lhs, const char *rhs) {
  // size_t lhs_length = strlen(lhs);
  // size_t rhs_length = strlen(rhs);
  // if (lhs_length != rhs_length) {
  //   return -1;
  // }

  int distance = 0;
  // for (int i = 0; i < (int) lhs_length; i++) {
  for (; *lhs && *rhs; lhs++, rhs++) {
    if (*lhs != *rhs) {
      distance++;
    }
  }
  return (*lhs || *rhs) ? -1 : distance;
}
