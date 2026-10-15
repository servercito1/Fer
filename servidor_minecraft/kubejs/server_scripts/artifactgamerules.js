ServerEvents.loaded(event => {
    const server = event.server;

    server.runCommandSilent('/gamerule artifacts.powerGlove.attackDamageBonus 2');
    server.runCommandSilent('/gamerule artifacts.vampiricGlove.absorptionChance 40');
    server.runCommandSilent('/gamerule artifacts.vampiricGlove.absorptionRatio 5');
});
