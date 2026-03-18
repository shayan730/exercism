#include "hamming.h"

int compute(const char *lhs, const char *rhs) {
  if (!lhs || !rhs)
    return ERROR;

  int distance = 0;
  for (; *lhs && *rhs; lhs++, rhs++) {
    if (*lhs != *rhs) {
      distance++;
    }
  }
  return (*lhs || *rhs) ? ERROR : distance;
}
