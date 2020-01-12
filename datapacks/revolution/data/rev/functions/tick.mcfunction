#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions
#---------------------------------------------------------------------------------------------------
# Any function here usually has it's own handling for lobby time and match time.
execute as @a[tag=!Registered] run function rev:player/register

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the lobby stage
#---------------------------------------------------------------------------------------------------
execute as @a[gamemode=spectator] if score GameState gameVariable matches 0 run function rev:player/return_from_spectator
execute if score GameState gameVariable matches 0 run function rev:lobby/team_selected
execute if score GameState gameVariable matches 0 run function rev:lobby/check_ready_levers

# I honestly don't care if people die of hunger while in the lobby. If the lobby times goes so long
# that people are dying of hunger, perhaps they start the game already!
#execute if score GameState gameVariable matches 0 run effect give @a minecraft:saturation 3 10 true

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the match
#---------------------------------------------------------------------------------------------------
execute if score GameState gameVariable matches 1 run function rev:game/objective/check_levers
execute if score GameState gameVariable matches 1 run function rev:game/objective/protect_lever_and_clear_blocks
execute as @a at @s if score GameState gameVariable matches 1 run function rev:game/out_of_bounds

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions after the match
#---------------------------------------------------------------------------------------------------
execute if score GameState gameVariable matches 2 if entity @a[scores={reset=1}] run function rev:reset