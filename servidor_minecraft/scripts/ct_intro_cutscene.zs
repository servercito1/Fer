import crafttweaker.api.events.EventManager;
import crafttweaker.forge.api.event.level.LevelEvent;
import crafttweaker.forge.api.event.Event;
import crafttweaker.forge.api.event.level.CreateSpawnPositionEvent;
import crafttweaker.api.game.Server;
import crafttweaker.api.world.ServerLevel;
import crafttweaker.forge.api.event.entity.player.PlayerLoggedInEvent;
import crafttweaker.api.bracket.CommandStringDisplayable;
import crafttweaker.forge.api.event.entity.player.PlayerRespawnEvent;
import crafttweaker.api.util.math.BlockPos;
import crafttweaker.api.data.MapData;
import crafttweaker.api.data.IData;
import crafttweaker.api.util.math.Random;
import crafttweaker.api.block.BlockState;
import crafttweaker.api.world.CraftTweakerSavedData;
import crafttweaker.api.world.SavedData;
import crafttweaker.forge.api.event.entity.player.PlayerChangedDimensionEvent;

events.register<crafttweaker.forge.api.event.entity.player.PlayerChangedDimensionEvent>(event => {
    println("PlayerChangedDimensionEvent ran!");
    val sPlayerLevel = event.entity.level as ServerLevel;

    if(!sPlayerLevel.isClientSide) {
        val sDataLevel = sPlayerLevel.server.getLevel(<resource:minecraft:overworld>);
        val sUndergardenLevel = sPlayerLevel.server.getLevel(<resource:undergarden:undergarden>);
        val pPlayer = event.entity;
        val playerPos = new BlockPos(pPlayer.blockX, pPlayer.blockY, pPlayer.blockZ);
        val spawnX = pPlayer.blockX;
        val spawnY = pPlayer.blockY;
        val spawnZ = pPlayer.blockZ;
        
        if(sDataLevel.customData.data.isEmpty) {
            sDataLevel.customData.data = ({
            "gameStarted": 1
            });

            sUndergardenLevel.sequence()
               .sleep(120)
               .then(level => {
               sUndergardenLevel.server.executeCommand("execute in undergarden:undergarden run playsound minecraft:block.respawn_anchor.charge ambient @p "+spawnX+" "+spawnY+" "+spawnZ+" 1 0.65", true);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(-1, 1, -2), <blockstate:infinite_abyss:strange_pillar>);
               })
               .sleep(2)
               .then(level => {
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(1, 2, -2), <blockstate:infinite_abyss:strange_pillar>);
               })
               .sleep(2)
               .then(level => {
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(0, 1, 2), <blockstate:infinite_abyss:strange_pillar>);
               })
               .sleep(2)
               .then(level => {
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(-1, 3, -1), <blockstate:infinite_abyss:strange_pillar>);
               })
               .sleep(2)
               .then(level => {
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(1, 3, 1), <blockstate:infinite_abyss:strange_pillar>);
               })
               .sleep(2)
               .then(level => {
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(-2, 0, -1), <blockstate:infinite_abyss:strange_pillar>);
               })
               .sleep(2)
               .then(level => {
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(2, 2, 0), <blockstate:infinite_abyss:strange_pillar>);
               })
               .sleep(2)
               .then(level => {
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(2, 0, 1), <blockstate:infinite_abyss:strange_pillar>);
               })
               .sleep(2)
               .then(level => {
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(1, 0, -2), <blockstate:infinite_abyss:strange_pillar>);
               })
               .sleep(2)
               .then(level => {
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(-2, 2, 1), <blockstate:infinite_abyss:strange_pillar>);
               })
               .sleep(75)
               .then(level => {
               sUndergardenLevel.server.executeCommand("execute in undergarden:undergarden run playsound minecraft:block.respawn_anchor.deplete ambient @p "+spawnX+" "+spawnY+" "+spawnZ+" 1 0.7", true);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(2, 0, 1), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(2, 0, 0), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(2, 1, 1), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(2, 1, 0), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(2, 1, -1), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(2, 2, 0), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(2, 2, -1), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(0, 0, 2), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(-1, 1, 2), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(0, 1, 2), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(1, 1, 2), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(1, 2, 2), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(0, 2, 2), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(-2, 0, -1), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(-2, 0, 0), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(-2, 1, 0), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(-2, 2, 1), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(1, 0, -2), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(0, 0, -2), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(0, 1, -2), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(-1, 1, -2), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(1, 2, -2), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(-1, 3, -1), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(1, 3, 1), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(0, -2, 0), <blockstate:minecraft:air>);
               sUndergardenLevel.setBlockAndUpdate(playerPos.offset(0, 2, 0), <blockstate:minecraft:air>);
               })
               .start();
        }
    }
});