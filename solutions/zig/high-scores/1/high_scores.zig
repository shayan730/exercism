const std = @import("std");

pub const HighScores = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    scores: []const i32,

    pub fn init(scores: []const i32) HighScores {
        return HighScores{ .scores = scores };
    }

    pub fn latest(self: *const HighScores) ?i32 {
        return self.scores[self.scores.len - 1];
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        return std.mem.max(i32, self.scores);
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        var result = [_]i32{std.math.minInt(i32)} ** 3;
        for (self.scores) |score| {
            if (score >= result[2]) {
                if (score >= result[1]) {
                    if (score >= result[0]) {
                        result[2] = result[1];
                        result[1] = result[0];
                        result[0] = score;
                    } else {
                        result[2] = result[1];
                        result[1] = score;
                    }
                } else {
                    result[2] = score;
                }
            }
        }
        if (self.scores.len < 3) return result[0..self.scores.len];
        return result[0..];
    }
};
