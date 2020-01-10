bossbar set blue name {"translate":"Winner: %s","color":"white","with":[{"text":"Blue","color":"blue"}]}
bossbar set red name {"translate":"Tried their best: %s","color":"gray","italic":true,"with":[{"text":"Red","color":"red"}]}

tellraw @a {"translate":">>> %s","color":"white","with":[{"text":"Blue wins!","color":"blue"}]}
function rev:game/end_round

summon minecraft:firework_rocket 253.5 109.00 163.5 {LifeTime:10,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1,Colors:[I;2437522],FadeColors:[I;1973019,6719955,15790320]}],Flight:1}}}}
summon minecraft:firework_rocket 253.5 109.00 163.5 {LifeTime:15,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1,Colors:[I;2437522],FadeColors:[I;1973019,6719955,15790320]}],Flight:1}}}}
summon minecraft:firework_rocket 253.5 109.00 163.5 {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:2,Trail:1,Colors:[I;2437522],FadeColors:[I;1973019,6719955,15790320]}],Flight:1}}}}
summon minecraft:firework_rocket 253.5 109.00 163.5 {LifeTime:35,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:3,Trail:1,Colors:[I;2437522],FadeColors:[I;1973019,6719955,15790320]}],Flight:1}}}}
