#> bingo:game/start/move_z/f
#
# @within function bingo:game/start/move_z/e

execute if score $game/start.spawnz bingo.tmp matches 2.. run scoreboard players remove $game/start.spawnz bingo.tmp 2

execute if score $game/start.spawnz bingo.tmp matches ..0 run function bingo:game/start/pre_gen/initialize
execute if score $game/start.spawnz bingo.tmp matches 1.. positioned ~915 ~ ~ run function bingo:game/start/pre_gen/initialize