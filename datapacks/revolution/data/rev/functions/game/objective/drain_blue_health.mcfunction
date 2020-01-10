# Decrease life by a tick
scoreboard players remove Blue objectiveTime 1
# MATH IT UP!
scoreboard players operation #InSeconds gameVariable = Blue objectiveTime
scoreboard players operation #Every20Ticks gameVariable = Blue objectiveTime
function rev:math/divide_by_twenty

# Check value of #Every20Ticks gameVariable and set the correct color
execute if score #Every20Ticks gameVariable matches 0..4 run bossbar set minecraft:blue name {"text":"Blue","color":"white"}
execute if score #Every20Ticks gameVariable matches 0 run playsound minecraft:block.note_block.bit master @a[team=blue] 253 104 144 999999 0.7
execute if score #Every20Ticks gameVariable matches 5.. run bossbar set blue name {"text":"Blue","color":"blue"}

# This is how you set boss bar to a scoreboard value
execute store result bossbar minecraft:blue value run scoreboard players get #InSeconds gameVariable