# Decrease life by a tick
scoreboard players remove Red objectiveTime 1
# MATH IT UP!
scoreboard players operation #InSeconds gameVariable = Red objectiveTime
scoreboard players operation #Every20Ticks gameVariable = Red objectiveTime
function rev:math/divide_by_twenty

# Update bossbar
execute if score #Every20Ticks gameVariable matches 0..4 run bossbar set minecraft:red name {"text":"Red","color":"white"}
execute if score #Every20Ticks gameVariable matches 0 run playsound minecraft:block.note_block.bit master @a[team=red] 253 104 244 999999 0.7
execute if score #Every20Ticks gameVariable matches 5.. run bossbar set red name {"text":"Red","color":"red"}

# This is how you set boss bar to a scoreboard value
execute store result bossbar minecraft:red value run scoreboard players get #InSeconds gameVariable