function rev:reset/clone_blocks

# Spawn Rupert villager
kill @e[type=villager]
summon minecraft:villager 217 100 194


scoreboard players set Countdown gameVariable 300
scoreboard players set RedReady gameVariable 0
scoreboard players set BlueReady gameVariable 0
scoreboard players set CheckTeamsReady gameVariable 0
scoreboard players set BlueLeverState gameVariable 0
scoreboard players set RedLeverState gameVariable 0

# Set back to lobby state
scoreboard players set GameState gameVariable 0

scoreboard players operation Blue objectiveTime = ObjectiveMax gameVariable
scoreboard players operation Red objectiveTime = ObjectiveMax gameVariable


# Set specific rules for this map
gamerule doDaylightCycle false
gamerule keepInventory false
gamerule doWeatherCycle false
weather clear 1000000
gamerule showDeathMessages true
gamerule naturalRegeneration true
gamerule doMobSpawning false
gamerule mobGriefing false

# Submitted for the approval of the Midnight Society...
time set midnight

#---------------------------------------------------------------------------------------------------
# Purpose: Set block parts of the map back to default to avoid race condition errors
#---------------------------------------------------------------------------------------------------
# Raise red gates
fill 215 97 210 215 97 217 minecraft:redstone_block
# Raise blue gates
fill 215 97 171 215 97 178 minecraft:redstone_block

# Set lobby levers to off
setblock 214 100 171 minecraft:lever[powered=false,facing=south]
setblock 214 100 217 minecraft:lever[powered=false,facing=north]

# Set objective levers to off
setblock 253 104 144 minecraft:lever[powered=false,facing=south]
setblock 253 104 244 minecraft:lever[powered=false,facing=north]

# Respawn moving pistons
fill 273 93 180 277 90 180 minecraft:moving_piston
fill 273 93 148 277 90 148 minecraft:moving_piston
fill 273 93 208 277 90 208 minecraft:moving_piston
fill 273 93 240 277 90 240 minecraft:moving_piston

#---------------------------------------------------------------------------------------------------
# Purpose: Run follow-up functions to handle players currently in-game
#---------------------------------------------------------------------------------------------------
team leave @a
function rev:load

