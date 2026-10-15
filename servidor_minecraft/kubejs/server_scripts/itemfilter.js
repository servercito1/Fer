LootJS.modifiers(event => {
    event.addLootTableModifier(/.*/)
        .removeLoot('relics:space_dissector');
});