#---------------------------------------------------------------------------------------------------
# Determine what lever has been pulled and tick down
#---------------------------------------------------------------------------------------------------
# If the lever is on and the score is above 0, run tick_down_<team> function
execute if block 253 104 144 minecraft:lever[powered=true] if score BlueLeverState gameVariable matches 0 run playsound minecraft:entity.shulker.open master @a 253 104 144 999999
execute if block 253 104 144 minecraft:lever[powered=true] if score BlueLeverState gameVariable matches 0 run scoreboard players set BlueLeverState gameVariable 1
execute if block 253 104 144 minecraft:lever[powered=false] if score BlueLeverState gameVariable matches 1 run playsound minecraft:entity.shulker.close master @a 253 104 144 999999
execute if block 253 104 144 minecraft:lever[powered=false] if score BlueLeverState gameVariable matches 1 run bossbar set blue name {"text":"Blue","color":"blue"}
execute if block 253 104 144 minecraft:lever[powered=false] if score BlueLeverState gameVariable matches 1 run scoreboard players set BlueLeverState gameVariable 0
execute if block 253 104 144 minecraft:lever[powered=true] unless score Blue objectiveTime matches 0 run function rev:game/objective/drain_blue_health

execute if block 253 104 144 minecraft:lever[powered=true,facing=south] if score RedLeverState gameVariable matches 0 run playsound minecraft:entity.shulker.open master @a 253 104 244 999999
execute if block 253 104 144 minecraft:lever[powered=true,facing=south] if score RedLeverState gameVariable matches 0 run scoreboard players set RedLeverState gameVariable 1
execute if block 253 104 144 minecraft:lever[powered=false,facing=south] if score RedLeverState gameVariable matches 1 run playsound minecraft:entity.shulker.close master @a ~ ~ ~ 999999
execute if block 253 104 144 minecraft:lever[powered=false,facing=south] if score RedLeverState gameVariable matches 1 run bossbar set red name {"text":"Red","color":"red"}
execute if block 253 104 144 minecraft:lever[powered=false,facing=south] if score RedLeverState gameVariable matches 1 run scoreboard players set RedLeverState gameVariable 0
execute if block 253 104 244 minecraft:lever[powered=true] unless score Red objectiveTime matches 0 run function rev:game/objective/drain_red_health


# End game if [Blue/Red] on [objectiveTime] scoreboard matches 0 and declare winner
# The winner is the team with the highest score left
execute if score Blue objectiveTime matches 0 unless score GameState gameVariable matches 0 run function rev:game/red_wins
execute if score Red objectiveTime matches 0 unless score GameState gameVariable matches 0 run function rev:game/blue_wins