bossbar set red name {"translate":"Winner: %s","color":"white","with":[{"text":"Red","color":"red"}]}
bossbar set blue name {"translate":"Tried their best: %s","color":"gray","italic":true,"with":[{"text":"Blue","color":"blue"}]}

tellraw @a {"translate":">>> %s","color":"white","with":[{"text":"Red wins!","color":"red"}]}
function rev:game/end_round

summon minecraft:firework_rocket 253.5 109.00 226.5 {LifeTime:10,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1,Colors:[I;11743532],FadeColors:[I;1973019,14188952,15790320]}],Flight:1}}}}
summon minecraft:firework_rocket 253.5 109.00 226.5 {LifeTime:15,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1,Colors:[I;11743532],FadeColors:[I;1973019,14188952,15790320]}],Flight:1}}}}
summon minecraft:firework_rocket 253.5 109.00 226.5 {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:2,Trail:1,Colors:[I;11743532],FadeColors:[I;1973019,14188952,15790320]}],Flight:1}}}}
summon minecraft:firework_rocket 253.5 109.00 226.5 {LifeTime:35,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:3,Trail:1,Colors:[I;11743532],FadeColors:[I;1973019,14188952,15790320]}],Flight:1}}}}
