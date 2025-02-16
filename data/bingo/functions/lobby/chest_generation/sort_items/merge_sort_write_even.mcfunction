#> bingo:lobby/chest_generation/sort_items/merge_sort_write_even
#
# This function sorts the next 2 lists into the current output list
#
# @writes storage tmp.bingo:chest_generation categories
# @within
# 	function bingo:lobby/chest_generation/sort_items/merge_sort_even
# 	function bingo:lobby/chest_generation/sort_items/merge_sort_write_even

#>
# @private
#declare score_holder $chest_generation/sort.a

#>
# @private
#declare score_holder $chest_generation/sort.b

execute store result score $chest_generation/sort.a bingo.tmp run data get storage tmp.bingo:chest_generation mergeSort.odd[-1][-1].weight
execute store result score $chest_generation/sort.b bingo.tmp run data get storage tmp.bingo:chest_generation mergeSort.odd[-2][-1].weight

execute if score $chest_generation/sort.a bingo.tmp > $chest_generation/sort.b bingo.tmp run data modify storage tmp.bingo:chest_generation mergeSort.even[-1] append from storage tmp.bingo:chest_generation mergeSort.odd[-1][-1]
execute if score $chest_generation/sort.a bingo.tmp > $chest_generation/sort.b bingo.tmp run data remove storage tmp.bingo:chest_generation mergeSort.odd[-1][-1]

execute if score $chest_generation/sort.a bingo.tmp <= $chest_generation/sort.b bingo.tmp run data modify storage tmp.bingo:chest_generation mergeSort.even[-1] append from storage tmp.bingo:chest_generation mergeSort.odd[-2][-1]
execute if score $chest_generation/sort.a bingo.tmp <= $chest_generation/sort.b bingo.tmp run data remove storage tmp.bingo:chest_generation mergeSort.odd[-2][-1]

execute if data storage tmp.bingo:chest_generation mergeSort.odd[-1][0] if data storage tmp.bingo:chest_generation mergeSort.odd[-2][0] run function bingo:lobby/chest_generation/sort_items/merge_sort_write_even