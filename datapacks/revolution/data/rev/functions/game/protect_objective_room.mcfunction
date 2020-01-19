#---------------------------------------------------------------------------------------------------
# Purpose: Players cannot place blocks in the objective room. If they do so, stop the objective from
#		   draining health by turning the lever off. If you're a player and reading this, too bad
#		   for you.
#---------------------------------------------------------------------------------------------------

# Blue room
# If lever doesn't exist, make lever exist
execute unless block 253 104 244 minecraft:lever run setblock 253 104 144 minecraft:lever[powered=false]
execute unless block 254 104 144 minecraft:oak_wall_sign run setblock 254 104 144 minecraft:oak_wall_sign[facing=south]{Color: "black",Text1: '{"text":"|     OFF     |"}',Text2: '{"text":"----------"}',Text3: '{"text":"----------"}',Text4: '{"text":"|     ON      |"}'}
# Prevent players from placing blocks here
execute unless blocks 253 105 144 254 105 144 255 146 201 all run fill 253 105 144 254 105 144 minecraft:air
execute unless blocks 253 103 144 254 103 144 255 146 201 all run fill 253 103 144 254 103 144 minecraft:air
execute unless blocks 251 103 145 256 106 148 255 146 201 all run fill 251 103 145 256 106 148 minecraft:air

# Red room
execute unless block 253 104 244 minecraft:lever run setblock 253 104 244 minecraft:lever[powered=false,facing=south]
execute unless block 254 104 244 minecraft:oak_wall_sign run setblock 254 104 244 minecraft:oak_wall_sign{Color: "black",Text1: '{"text":"|     OFF     |"}',Text2: '{"text":"----------"}',Text3: '{"text":"----------"}',Text4: '{"text":"|     ON      |"}'}
execute unless blocks 253 105 244 254 105 244 255 146 201 all run fill 253 105 244 254 105 244 minecraft:air
execute unless blocks 254 103 244 253 103 244 255 146 201 all run fill 254 103 244 253 103 244 minecraft:air
execute unless blocks 251 103 240 256 106 243 255 146 201 all run fill 251 103 240 256 106 243 minecraft:air