EntityEvents.spawned(event => {
  const entity = event.entity;
  if (entity.type == "minecraft:warden") {

    // Run a short delay to ensure the Warden finishes spawning
    event.server.scheduleInTicks(20, () => {
      if (!entity.isAlive()) return;

      try {
        // Modify core attributes
        entity.getAttribute("minecraft:generic.max_health").baseValue = 1000.0;
        entity.getAttribute("minecraft:generic.attack_damage").baseValue = 30.0;

        // Heal to full after max health change
        entity.health = entity.getAttribute("minecraft:generic.max_health").baseValue;

        // Optional: make the change permanent
        entity.persistentData.putBoolean("kubejs_warden_modified", true);

        console.log("Modified Warden stats successfully!");
      } catch (err) {
        console.error("Failed to modify Warden attributes:", err);
      }
    });
  }
});
