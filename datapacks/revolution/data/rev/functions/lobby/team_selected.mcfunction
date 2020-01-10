# Flag player to be added to team if not on team
tag @a[team=!red,scores={teamSelected=1}] add JoinRed
tag @a[team=!blue,scores={teamSelected=2}] add JoinBlue
tag @a[team=!blue,scores={teamSelected=3}] add Spectate
# Remove player if already on that team
tag @a[team=red,scores={teamSelected=1}] add LeaveTeam
tag @a[team=blue,scores={teamSelected=2}] add LeaveTeam

# Leave your team
tp @a[team=blue,tag=LeaveTeam] 210 99 173
tp @a[team=red,tag=LeaveTeam] 210 99 215
tag @a[team=blue,tag=LeaveTeam] remove JoinBlue
tag @a[team=red,tag=LeaveTeam] remove JoinRed
team leave @a[tag=LeaveTeam]
execute as @a[tag=LeaveTeam] run tellraw @a {"translate":"%s abandoned their people.", "with":[{"selector":"@s[tag=LeaveTeam]" } ] }

# Join Blue
execute as @a[tag=JoinBlue] run tellraw @a {"translate":"%s sided with %s.", "with":[{"selector":"@s[tag=JoinBlue]", "color":"blue" }, {"translate":"Blue", "color":"blue"} ] }
team join blue @a[tag=JoinBlue]
tp @a[tag=JoinBlue] 213 99 173

# Join Red
execute as @a[tag=JoinRed] run tellraw @a {"translate":"%s sided with %s.", "with":[{"selector":"@s[tag=JoinRed]", "color":"red" }, {"translate":"Red", "color":"red"} ] }
team join red @a[tag=JoinRed]
tp @a[tag=JoinRed] 213 99 215

# Spectate
team leave @a[tag=Spectate]
gamemode spectator @a[tag=Spectate]


# Reset tags
tag @a[tag=JoinBlue] remove JoinBlue
tag @a[tag=JoinRed] remove JoinRed
tag @a[tag=Spectate] remove Spectate
tag @a[tag=LeaveTeam] remove LeaveTeam
scoreboard players set @a[scores={teamSelected=1..}] teamSelected 0
scoreboard players enable @a teamSelected