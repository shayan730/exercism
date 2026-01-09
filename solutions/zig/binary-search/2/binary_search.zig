// Take a look at the tests, you might have to change the function arguments

const std = @import("std");
pub fn binarySearch(T: type, target: T, items: []const T) ?usize {
    var lo: usize = 0;
    var hi: usize = items.len;
    while (lo < hi) {
        const mid = (lo + hi) / 2;
        if (items[mid] == target) {
            return mid;
        } else if (items[mid] > target) {
            hi = mid;
        } else {
            lo = mid + 1;
        }
    }
    return null;
}
