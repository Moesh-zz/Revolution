# GLOSSERY
# camalCase = Indicates a scoreboard objective
# PascalCase = A fake player holding a variable
# CAPITALS = A fake player holding constant on the CONST scoreboard

#tag @a remove Registered

#---------------------------------------------------------------------------------------------------
# Purpose: Set-up teams
#---------------------------------------------------------------------------------------------------
team remove blue
team add blue {"text":"Blue","color":"blue"}
	team modify blue collisionRule pushOtherTeams
	team modify blue deathMessageVisibility always
	team modify blue nametagVisibility always
	team modify blue friendlyFire false
	team modify blue seeFriendlyInvisibles true
	team modify blue color blue

team remove red
team add red {"text":"Red","color":"red"}
	team modify red collisionRule pushOtherTeams
	team modify red deathMessageVisibility always
	team modify red nametagVisibility always
	team modify red friendlyFire false
	team modify red seeFriendlyInvisibles true
	team modify red color red

#---------------------------------------------------------------------------------------------------
# Purpose: Set-up objectives
#---------------------------------------------------------------------------------------------------
# Variables and random stuff
scoreboard objectives remove CONST
scoreboard objectives add CONST dummy
	scoreboard players set TWENTY CONST 20

# SET GAME VARIABLES
scoreboard objectives remove gameVariable
scoreboard objectives add gameVariable dummy
	scoreboard players set ObjectiveMax gameVariable 1600
	scoreboard players set GameState gameVariable 0
		# 0 = not in-progress
		# 1 = in-progress
		# 2 = unused, usually "game ending stage"
	scoreboard players set Countdown gameVariable 300
	scoreboard players set RedReady gameVariable 0
	scoreboard players set BlueReady gameVariable 0
	scoreboard players set CheckTeamsReady gameVariable 0
	scoreboard players set BlueLeverState gameVariable 0
	scoreboard players set RedLeverState gameVariable 0

# Used in [game/objective/drain_<team name>]
scoreboard objectives remove objectiveTime
scoreboard objectives add objectiveTime dummy
	# Set objectives to this.
	scoreboard players operation Blue objectiveTime = ObjectiveMax gameVariable
	scoreboard players operation Red objectiveTime = ObjectiveMax gameVariable

# Used in [lobby/team_selected]
scoreboard objectives remove teamSelected
scoreboard objectives add teamSelected trigger

# yCoord used to detect if spectators want to return [lobby/return_spectator]
scoreboard objectives remove yCoord
scoreboard objectives add yCoord dummy

# Health! Show below names!
scoreboard objectives remove health
scoreboard objectives add health health {"text":"❤","color":"red"}
	scoreboard objectives setdisplay belowName health

scoreboard objectives remove kills
scoreboard objectives add kills playerKillCount {"text":"Kills","color":"green"} 
	scoreboard objectives setdisplay sidebar kills

scoreboard objectives remove deaths
scoreboard objectives add deaths deathCount {"text":"Deaths","color":"green"}

scoreboard objectives remove reset
scoreboard objectives add reset trigger

#---------------------------------------------------------------------------------------------------
# Purpose: Set-up bossbars
#---------------------------------------------------------------------------------------------------
# Remove old bossbars
bossbar remove blue
bossbar remove red

# Set fake players needed for setting bossbar from gameVariable settings
scoreboard players operation #InSeconds gameVariable = ObjectiveMax gameVariable
scoreboard players operation #InSeconds gameVariable /= TWENTY CONST

# NOTE: notched_ type bossbars are messed up. The second one displays incorrectly. File or find a bug?
bossbar add blue {"text":"Blue","color":"blue"}
	bossbar set blue color blue
	bossbar set blue name {"text":"Blue"}
	bossbar set blue style progress
	bossbar set blue visible true
	bossbar set minecraft:blue players @a
	# Set score based on gameVariables scoreboard (defaults set above)
	execute store result bossbar minecraft:blue max run scoreboard players get #InSeconds gameVariable
	execute store result bossbar minecraft:blue value run scoreboard players get #InSeconds gameVariable

bossbar add red {"text":"Red","color":"red"}
	bossbar set red color red
	bossbar set red name {"text":"Red"}
	bossbar set red style progress
	bossbar set red visible true
	bossbar set minecraft:red players @a
	# Set score based on gameVariables scoreboard (defaults set above)
	execute store result bossbar minecraft:red max run scoreboard players get #InSeconds gameVariable
	execute store result bossbar minecraft:red value run scoreboard players get #InSeconds gameVariable

#---------------------------------------------------------------------------------------------------
# Purpose: Set all game rules
#---------------------------------------------------------------------------------------------------
# TODO: Set to false after development before shipping
gamerule commandBlockOutput true
gamerule logAdminCommands true
gamerule sendCommandFeedback true


# Set specific rules for this map
gamerule doDaylightCycle false
gamerule keepInventory false
gamerule doTileDrops true
gamerule doWeatherCycle false
weather clear 1000000
gamerule showDeathMessages true
gamerule naturalRegeneration true

# Other gamerules 
gamerule doImmediateRespawn false
gamerule disableRaids false
gamerule doInsomnia false
gamerule doLimitedCrafting false
gamerule announceAdvancements false
gamerule doEntityDrops true
gamerule doFireTick true
gamerule doMobLoot true
gamerule doMobSpawning false
gamerule mobGriefing false

# Probably never needs to change
gamerule maxCommandChainLength 65536
gamerule maxEntityCramming 0
gamerule randomTickSpeed 10
gamerule reducedDebugInfo false
gamerule disableElytraMovementCheck true
gamerule spectatorsGenerateChunks false
gamerule spawnRadius 7

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

# Use moving_piston to block water from flowing into the void. Each block of this is the same as
# having a chest in the world. It'd be best to avoid using this when possible. I wouldn't use any
# more than a couple hundred at a time. The risk is that players will suffer from performance drops.
fill 273 93 180 277 90 180 minecraft:moving_piston
fill 273 93 148 277 90 148 minecraft:moving_piston
fill 273 93 208 277 90 208 minecraft:moving_piston
fill 273 93 240 277 90 240 minecraft:moving_piston

# Reset all the things
tp @e[type=!player,type=!villager] ~ 0 ~
kill @e[type=!player,type=!villager]


#---------------------------------------------------------------------------------------------------
# Purpose: Run follow-up functions to handle players currently in-game
#---------------------------------------------------------------------------------------------------
tag @a remove Registered

tellraw @a {"text":"Reloaded the Revolution datapack","color":"green"}