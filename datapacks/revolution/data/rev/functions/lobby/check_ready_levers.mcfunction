#---------------------------------------------------------------------------------------------------
# Purpose: Handle flipping of levers. This is a rough and dirty upgrade of mechanics once handled by
#		   a redstone circuit. 
#---------------------------------------------------------------------------------------------------

# BLUE
# Powered, ready
execute if block 214 100 171 minecraft:lever[powered=true] unless score BlueReady gameVariable matches 1 run tellraw @a {"translate":"%s %s is READY!","color":"green","with":[{"text":">>>","color":"white"},{"text":"Blue","color":"blue"}]}
execute if block 214 100 171 minecraft:lever[powered=true] unless score BlueReady gameVariable matches 1 run scoreboard players set BlueReady gameVariable 1
# Unpowered, not ready
execute if block 214 100 171 minecraft:lever[powered=false] unless score BlueReady gameVariable matches 0 run tellraw @a {"translate":"%s %s is not ready.","color":"green","with":[{"text":">>>","color":"white"},{"text":"Blue","color":"blue"}]}
execute if block 214 100 171 minecraft:lever[powered=false] unless score BlueReady gameVariable matches 0 run scoreboard players set BlueReady gameVariable 0

# RED
# Powered, ready
execute if block 214 100 217 minecraft:lever[powered=true] unless score RedReady gameVariable matches 1 run tellraw @a {"translate":"%s %s is READY!","color":"green","with":[{"text":">>>","color":"white"},{"text":"Red","color":"red"}]}
execute if block 214 100 217 minecraft:lever[powered=true] unless score RedReady gameVariable matches 1 run scoreboard players set RedReady gameVariable 1
# Unpowered, not ready
execute if block 214 100 217 minecraft:lever[powered=false] unless score RedReady gameVariable matches 0 run tellraw @a {"translate":"%s %s is not ready.","color":"green","with":[{"text":">>>","color":"white"},{"text":"Red","color":"red"}]}
execute if block 214 100 217 minecraft:lever[powered=false] unless score RedReady gameVariable matches 0 run scoreboard players set RedReady gameVariable 0


# Is both levers are pulled, CheckTeamsReady should equal 2. 
scoreboard players operation CheckTeamsReady gameVariable = BlueReady gameVariable
scoreboard players operation CheckTeamsReady gameVariable += RedReady gameVariable

execute if score CheckTeamsReady gameVariable matches 2 run function rev:lobby/countdown
execute if score CheckTeamsReady gameVariable matches ..1 unless score Countdown gameVariable matches 300 run scoreboard players set Countdown gameVariable 300