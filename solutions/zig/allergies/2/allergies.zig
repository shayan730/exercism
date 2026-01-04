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
    const allergens = std.enums.values(Allergen);
    for (allergens) |allergen| {
        if (isAllergicTo(score, allergen)) set.insert(allergen);
    }
    return set;
}
