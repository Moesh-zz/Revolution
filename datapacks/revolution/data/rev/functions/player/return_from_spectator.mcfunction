execute as @a at @s if entity @s[y=80,dy=-100] run tag @s add LeaveSpectator
gamemode adventure @s[tag=LeaveSpectator]
tp @s[tag=LeaveSpectator] 203 99 194 -90 0
tag @a[tag=LeaveSpectator] remove LeaveSpectator