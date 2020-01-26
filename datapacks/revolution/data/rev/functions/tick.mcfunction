#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions
#---------------------------------------------------------------------------------------------------
# Any function here usually has it's own handling for lobby time and match time.
execute as @a[tag=!Registered] run function rev:player/register
execute as @a[scores={leaveGame=1..}] at @s run function rev:player/left_game

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the lobby stage
#---------------------------------------------------------------------------------------------------
execute as @a[gamemode=spectator] if score GameState gameVariable matches 0 run function rev:player/return_from_spectator
execute if score GameState gameVariable matches 0 run function rev:lobby/team_selected
execute if score GameState gameVariable matches 0 run function rev:lobby/check_ready_levers
execute as @a at @s if score GameState gameVariable matches 0 run function rev:lobby/out_of_bounds

# I honestly don't care if people die of hunger while in the lobby. If the lobby times goes so long
# that people are dying of hunger, perhaps they should start the game already!
#execute if score GameState gameVariable matches 0 run effect give @a minecraft:saturation 3 10 true

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the match
#---------------------------------------------------------------------------------------------------
# Let players run a GG command to end a game early
# This next line is essentially protection of players against themselves. They can use
# /trigger set gg 0, therefore disabling the gg trigger for themselves. 
execute if score GameState gameVariable matches 1 run scoreboard players enable @a[scores={gg=..0}] gg
execute if score GameState gameVariable matches 1 run scoreboard players set @a[scores={gg=..0}] gg 0
execute if entity @a[scores={gg=1..}] if score GameState gameVariable matches 1 run function rev:game/gg

# Ensure no blocks have been placed in the room and that the lever is still intact.
execute if score GameState gameVariable matches 1 run function rev:game/objective/protect_room
execute if score GameState gameVariable matches 1 run function rev:game/objective/check_levers

# 
execute as @a at @s unless entity @s[gamemode=spectator] if score GameState gameVariable matches 1 run function rev:game/out_of_bounds

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions after the match
#---------------------------------------------------------------------------------------------------
scoreboard players set @a[scores={reset=..-1}] reset 1
execute if score GameState gameVariable matches 2 if entity @a[scores={reset=1..32}] run function rev:reset
execute if score GameState gameVariable matches 2 if entity @a[scores={reset=33}] run function rev:reset/legacy