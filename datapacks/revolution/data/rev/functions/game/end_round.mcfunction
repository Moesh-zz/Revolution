tellraw @a {"translate":">>> %s","color":"white","with":[{"text":"The match is over.","color":"green"}]}
playsound minecraft:event.raid.horn master @a 217 100 195 999999

gamemode spectator @a

# Raise red gates
fill 215 97 210 215 97 217 minecraft:redstone_block
# Raise blue gates
fill 215 97 171 215 97 178 minecraft:redstone_block
setblock 214 100 217 minecraft:air
setblock 214 100 171 minecraft:air

# Set gamestate to 2 (after game is finished)
# I suppose I can use later use this to make a cool reset thing.
scoreboard players set GameState gameVariable 2



# A bit of a hacky way to enable a map reset for all players.
tellraw @a {"translate":"Thanks for playing! Use [%s] to play again.","color":"green","with":[{"text":"/trigger reset set 1","color":"white"}]}
scoreboard players set @a reset 0
scoreboard players enable @a reset