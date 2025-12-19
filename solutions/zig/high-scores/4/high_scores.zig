const std = @import("std");

pub const HighScores = struct {
    last: ?i32,
    last_idx: usize,
    top_three: [3]i32,

    pub fn init(scores: []const i32) HighScores {
        var self = HighScores{ .last = null, .last_idx = 0, .top_three = @splat(std.math.minInt(i32)) };
        for (scores) |score| {
            self.last_idx += 1;
            if (score >= self.top_three[2]) {
                if (score >= self.top_three[1]) {
                    if (score >= self.top_three[0]) {
                        self.top_three[2] = self.top_three[1];
                        self.top_three[1] = self.top_three[0];
                        self.top_three[0] = score;
                    } else {
                        self.top_three[2] = self.top_three[1];
                        self.top_three[1] = score;
                    }
                } else {
                    self.top_three[2] = score;
                }
            }
        }
        self.last = scores[scores.len - 1];
        return self;
    }

    pub fn latest(self: *const HighScores) ?i32 {
        return self.last;
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        return self.top_three[0];
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        if (self.last_idx < 3) return self.top_three[0..self.last_idx];
        return self.top_three[0..];
    }
};
