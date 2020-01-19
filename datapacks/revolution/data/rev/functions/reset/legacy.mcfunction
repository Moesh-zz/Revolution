#---------------------------------------------------------------------------------------------------
# Purpose: Allow players to start the map again without resetting anything.
#---------------------------------------------------------------------------------------------------
function rev:reset/set_rules
function rev:reset/set_important_blocks
schedule function rev:reset/clear_entities 1t

# A bit of a hacky way to enable a map reset for all players.
# This method also allows me to do a legacy reset, allowing players to play the map without resetting
# the terrain. You know, for the sickos out there.
tellraw @a {"translate":"Secret found!","color":"light_purple"}
tellraw @a {"translate":"Legacy reset! The map remains, but the game can be played again! Use [%s] to reset normal.","color":"green","with":[{"text":"/trigger reset set 1","color":"white"}]}
scoreboard players set @a reset 0
scoreboard players enable @a reset