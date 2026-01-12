const std = @import("std");

pub fn response(s: []const u8) []const u8 {
    var question: bool = false;
    var yell: bool = false;
    var no_yell: bool = false;
    var not_much = true;
    for (s) |c| {
        switch (c) {
            '\n', '\r', '\t', ' ' => not_much = true,
            '?' => {
                question = true;
                not_much = false;
            },
            'A'...'Z' => {
                yell = true;
                not_much = false;
                question = false;
            },
            'a'...'z' => {
                yell = false;
                no_yell = true;
                not_much = false;
                question = false;
            },
            else => not_much = false,
        }
    }

    if ((question and no_yell) or (question and !yell)) return "Sure.";
    if (question and yell and !no_yell) return "Calm down, I know what I'm doing!";
    if (!question and yell and !no_yell) return "Whoa, chill out!";
    if (not_much and !question and !yell and !no_yell) return "Fine. Be that way!";
    return "Whatever.";
}
