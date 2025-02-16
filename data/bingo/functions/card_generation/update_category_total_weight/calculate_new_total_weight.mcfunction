#> bingo:card_generation/update_category_total_weight/calculate_new_total_weight
#
# Recalculates the current category's total weight
#
# @within
# 	function bingo:card_generation/update_category_total_weight/calculate_item_weight
# 	function bingo:card_generation/update_category_total_weight/calculate_new_total_weight

#>
# @private
#declare score_holder $card_gen/cat_weight.different_category
#>
# @private
#declare score_holder $card_gen/cat_weight.current_weight
execute store result score $card_gen/cat_weight.current_weight bingo.tmp run data get storage tmp.bingo:card_generation checkCategories[-1].weight

data modify storage tmp.bingo:card_generation category set from storage tmp.bingo:card_generation itemCategories[-1].id
execute store success score $card_gen/cat_weight.different_category bingo.tmp run data modify storage tmp.bingo:card_generation category set from storage tmp.bingo:card_generation checkCategories[-1].id

execute if score $card_gen/cat_weight.different_category bingo.tmp matches 0 run scoreboard players operation $card_gen/cat_weight.total_weight bingo.tmp -= $card_gen/cat_weight.current_weight bingo.tmp

data remove storage tmp.bingo:card_generation checkCategories[-1]
execute if data storage tmp.bingo:card_generation checkCategories[0] run function bingo:card_generation/update_category_total_weight/calculate_new_total_weight