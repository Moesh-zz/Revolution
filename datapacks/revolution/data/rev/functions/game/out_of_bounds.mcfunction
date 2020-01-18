#---------------------------------------------------------------------------------------------------
# Purpose: Check if players are in bound
#---------------------------------------------------------------------------------------------------
# We are executing as players at themselves.

# Let's consider the idea that all players are out of bounds
tag @s remove InBounds
# OK, let's check to see if players are in bounds. How expensive do you think this could be?
execute if block ~ 130 ~ minecraft:barrier if entity @s[y=81,dy=45] run tag @s add InBounds
title @s[gamemode=adventure,tag=InBounds] actionbar {"text":"In bounds","color":"green"}
gamemode survival @s[gamemode=adventure,tag=InBounds]

# These players are out of bounds
title @s[gamemode=survival,tag=!InBounds] actionbar {"text":"Out of bounds","color":"red"}
gamemode adventure @s[gamemode=survival,tag=!InBounds]
