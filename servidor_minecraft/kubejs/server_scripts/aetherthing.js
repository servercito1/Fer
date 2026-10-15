const OVERWORLD_ID = "minecraft:overworld"
const AETHER_ID = "aether:the_aether" // Change if needed

const TRIGGER_Y = 330
const TARGET_Y = 20

PlayerEvents.tick(event => {
    const player = event.player

    // Only check in Overworld
    if (player.level.dimension.toString() !== OVERWORLD_ID) return

    // If above trigger height
    if (player.y > TRIGGER_Y) {

        // Use execute in to change dimension safely
        player.server.runCommandSilent(
            `execute in ${AETHER_ID} run tp ${player.username} ${player.x} ${TARGET_Y} ${player.z}`
        )
    }
})