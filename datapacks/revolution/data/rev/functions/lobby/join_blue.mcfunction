# Flag player to be added to team if not on team
tag @s[team=!red,scores={teamSelected=1}] add JoinRed
tag @s[team=!blue,scores={teamSelected=2}] add JoinBlue
tag @s[team=!green,scores={teamSelected=3}] add JoinGreen

# Remove player if already on that team
tag @s[team=red] add LeaveTeam
tag @s[team=blue] add LeaveTeam
tag @s[team=green] add LeaveTeam
tag @s[tag=LeaveTeam,tag=JoinRed] remove JoinRed
tag @s[tag=LeaveTeam,tag=JoinBlue] remove JoinBlue
tag @s[tag=LeaveTeam,tag=JoinGreen] remove JoinGreen

# Reset trigger use
scoreboard players enable @a teamSelected

team join blue @a[tag=JoinBlue]
team join red @a[tag=JoinRed]
team leave @a[tag=LeaveTeam]
execute as @s[tag=JoinBlue] at @s run tellraw @a {"translate":"mk.team.join", "with":[{"selector":"@a[tag=JoinBlue]", "color":"blue" }, {"translate":"mk.team.blue", "color":"blue"} ] }
execute as @a[tag=JoinRed] at @s run tellraw @a {"translate":"mk.team.join", "with":[{"selector":"@a[tag=JoinRed]", "color":"red" }, {"translate":"mk.team.red", "color":"red"} ] }
execute as @a[tag=LeaveTeam] at @s run tellraw @a {"translate":"mk.team.leave", "with":[{"selector":"@a[tag=LeaveTeam]" } ] }

# Clean-up handling tags
tag @a[tag=JoinBlue] remove JoinBlue
tag @a[tag=JoinRed] remove JoinRed
tag @a[tag=LeaveTeam] remove LeaveTeam