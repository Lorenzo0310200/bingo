#> bingo:util/find_player_team/black
#
# Marks team aqua as current team
#
# @within function bingo:util/find_player_team

data modify storage tmp.bingo:find_team currentTeam set from storage bingo:card teams[{id: "bingo:black"}]
data remove storage bingo:card teams[{id: "bingo:black"}]
data modify storage bingo:card teams append from storage tmp.bingo:find_team currentTeam
tag @a[team=bingo.black] add bingo.in_current_team