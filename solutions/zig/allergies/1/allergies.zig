const std = @import("std");
const EnumSet = std.EnumSet;

pub const Allergen = enum(u8) {
    eggs,
    peanuts,
    shellfish,
    strawberries,
    tomatoes,
    chocolate,
    pollen,
    cats,
};

pub fn isAllergicTo(score: u64, allergen: Allergen) bool {
    return (score & (@as(u255, 1) << @intFromEnum(allergen))) != 0;
}

pub fn initAllergenSet(score: u64) EnumSet(Allergen) {
    var set = EnumSet(Allergen).initEmpty();
    if (isAllergicTo(score, .eggs)) set.insert(.eggs);
    if (isAllergicTo(score, .peanuts)) set.insert(.peanuts);
    if (isAllergicTo(score, .shellfish)) set.insert(.shellfish);
    if (isAllergicTo(score, .strawberries)) set.insert(.strawberries);
    if (isAllergicTo(score, .tomatoes)) set.insert(.tomatoes);
    if (isAllergicTo(score, .chocolate)) set.insert(.chocolate);
    if (isAllergicTo(score, .pollen)) set.insert(.pollen);
    if (isAllergicTo(score, .cats)) set.insert(.cats);
    return set;
}
