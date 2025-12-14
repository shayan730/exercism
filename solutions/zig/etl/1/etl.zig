const std = @import("std");
const mem = std.mem;

pub fn transform(allocator: mem.Allocator, legacy: std.AutoHashMap(i5, []const u8)) mem.Allocator.Error!std.AutoHashMap(u8, i5) {
    var map = std.AutoHashMap(u8, i5).init(allocator);
    errdefer map.deinit();
    var iter = legacy.iterator();
    while (iter.next()) |entry| {
        for (entry.value_ptr.*) |char| {
            try map.put(std.ascii.toLower(char), entry.key_ptr.*);
        }
    }

    return map;
}
