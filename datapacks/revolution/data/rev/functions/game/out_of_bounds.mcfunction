#---------------------------------------------------------------------------------------------------
# Purpose: Check if players are in bound
#---------------------------------------------------------------------------------------------------
# We are executing as players at themselves.

# Let's consider the idea that all players are out of bounds
tag @s[tag=InBounds] remove InBounds
tag @s[tag=AtEdge] remove AtEdge
tag @s[tag=AtEdge] remove AtEdge
# OK, let's check to see if players are in bounds. How expensive do you think this could be?

# Player is in bounds, let's make sure they're in survival mode.
execute if block ~ 0 ~ minecraft:barrier if entity @s[y=81,dy=45] run tag @s add InBounds
title @s[gamemode=adventure,tag=InBounds] actionbar {"text":"In bounds","color":"green"}
gamemode survival @s[gamemode=adventure]

# This player is at the edge of the playable area, put them in adventure mode!
execute if block ~ 1 ~ minecraft:barrier if entity @s[y=81,dy=45] run tag @s add AtEdge
title @s[gamemode=survival,tag=AtEdge] actionbar {"text":"Out of bounds","color":"red"}
gamemode adventure @s[gamemode=survival,tag=AtEdge]

# This player is in the game, and has entered the lobby outside of their spawn zone. Let's take
# everything from them for trying to enter a forbidden zone and reset their spawnpoint in case
# they didn't mean it.
execute if block ~ 2 ~ minecraft:barrier if block ~ 0 ~ minecraft:air if score @s health matches 1.. run tag @s add Forbidden
tellraw @s[tag=Forbidden] {"text":"You cannot enter the lobby during the game."}
# Target blue players
tp @a[team=blue,tag=Forbidden] 214 99 175
spawnpoint @a[team=blue,tag=Forbidden] 214 99 175
clear @a[team=blue,tag=Forbidden]
effect clear @a[team=blue,tag=Forbidden]
# Target red players
tp @a[team=red,tag=Forbidden] 214 99 213
spawnpoint @a[team=red,tag=Forbidden] 214 99 213
clear @a[team=red,tag=Forbidden]
effect clear @a[team=red,tag=Forbidden]

tag @s[tag=Forbidden] remove Forbidden

# The player is over void, apply a strong wither effect.
effect give @s[tag=!InBounds,tag=!AtEdge] minecraft:wither 3 15 false

# Player is below yLevel 5, kill them.
execute if entity @s[y=5,dy=-50] run kill @s