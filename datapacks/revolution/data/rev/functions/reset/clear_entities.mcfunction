# Remove all entities and items
tp @e[type=!player,type=!villager] ~ 0 ~
kill @e[type=!player,type=!villager]

# Spawn Rupert villager
tp @e[type=villager] ~ 0 ~
kill @e[type=villager]
summon minecraft:villager 217 100 194 {VillagerData:{level:1,profession:"minecraft:nitwit"},Invulnerable:1b,CustomNameVisible:1b,CustomName:'{"text":"Rupert"}'}