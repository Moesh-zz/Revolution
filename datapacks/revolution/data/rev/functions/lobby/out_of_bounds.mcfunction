#---------------------------------------------------------------------------------------------------
# Purpose: Check if players are in side the lobby. If not, teleport them back.
#---------------------------------------------------------------------------------------------------
# We are executing as players at themselves.

# Let's consider the idea that all players are out of bounds
tag @s remove InBounds
# OK, let's check to see if players are in bounds. How expensive do you think this could be?
execute if block ~ 129 ~ minecraft:barrier if entity @s[y=81,dy=45] run tag @s add InBounds

# These players are out of bounds
title @s[gamemode=adventure,tag=!InBounds] actionbar {"text":"There is no escape.","italic":true,"color":"black"}
tp @s[gamemode=adventure,tag=!InBounds] 203 99 194 -90 0 
