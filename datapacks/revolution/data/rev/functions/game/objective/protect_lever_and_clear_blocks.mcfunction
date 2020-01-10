#---------------------------------------------------------------------------------------------------
# Purpose: Players cannot place blocks in the objective room. If they do so, stop the objective from
#		   draining health by turning the lever off. If you're a player and reading this, too bad
#		   for you.
#		   If the objective lever doesn't exist, make lever exist.
#---------------------------------------------------------------------------------------------------
# Blue room
execute if block 253 104 144 minecraft:air run setblock 253 104 144 minecraft:lever[powered=false,facing=south]
execute unless blocks 251 106 145 256 103 148 255 146 201 all run fill 251 106 145 256 103 148 minecraft:air

# Red room

execute if block 253 104 244 minecraft:air run setblock 253 104 244 minecraft:lever[powered=false]
execute unless blocks 256 103 243 251 106 240 255 146 201 all run fill 256 103 243 251 106 240 minecraft:air
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------