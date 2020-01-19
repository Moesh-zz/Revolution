#---------------------------------------------------------------------------------------------------
# Purpose: Set block parts of the map back to default to avoid race condition errors
#---------------------------------------------------------------------------------------------------
# Raise red gates
fill 215 97 210 215 97 217 minecraft:redstone_block
# Raise blue gates
fill 215 97 171 215 97 178 minecraft:redstone_block

# Set lobby levers to off
setblock 214 100 171 minecraft:lever[powered=false,facing=south]
setblock 214 100 217 minecraft:lever[powered=false,facing=north]

# Set objective levers to off
setblock 253 104 144 minecraft:lever[powered=false,facing=south]
setblock 253 104 244 minecraft:lever[powered=false,facing=north]

# Use moving_piston to block water from flowing into the void. Each block of this is the same as
# having a chest in the world. It'd be best to avoid using this when possible. I wouldn't use any
# more than a couple hundred at a time. The risk is that players will suffer from performance drops.
fill 273 93 180 277 90 180 minecraft:moving_piston
fill 273 93 148 277 90 148 minecraft:moving_piston
fill 273 93 208 277 90 208 minecraft:moving_piston
fill 273 93 240 277 90 240 minecraft:moving_piston

# Remove the bedrock and set nether_brick_fence in team areas
# Blue
fill 212 99 179 212 102 171 minecraft:air
fill 213 99 179 214 102 179 minecraft:air
fill 213 102 178 214 102 171 minecraft:air
fill 212 99 171 212 99 178 minecraft:nether_brick_fence
fill 212 99 179 214 99 179 minecraft:nether_brick_fence

# Red
fill 213 99 209 214 102 209 minecraft:air
fill 212 99 209 212 102 217 minecraft:air
fill 214 102 210 213 102 217 minecraft:air
fill 212 99 209 214 99 209 minecraft:nether_brick_fence
fill 212 99 210 212 99 217 minecraft:nether_brick_fence