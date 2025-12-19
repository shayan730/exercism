const std = @import("std");

pub const HighScores = struct {
    last: ?i32 = null,
    idx: usize = 0,
    top_three: [3]i32 = @splat(std.math.minInt(i32)),

    pub fn init(scores: []const i32) HighScores {
        var self = HighScores{};
        for (scores) |score| {
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
        self.idx = if (scores.len < 3) scores.len else 3;
        return self;
    }

    pub fn latest(self: *const HighScores) ?i32 {
        return self.last;
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        return self.top_three[0];
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        return self.top_three[0..self.idx];
    }
};
