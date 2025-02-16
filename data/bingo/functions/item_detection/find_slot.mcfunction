#> bingo:item_detection/find_slot
#
# This function is used to iterate through the current slots until the correct
# one is found
#
# @within
# 	function bingo:item_detection/find_slot
# 	function bingo:item_detection/set_overlay
# @input score $item_detect/find_slot.slot_id bingo.tmp The slot id of the slot that is searched

#>
# The slot id of the slot that is searched
#
# This is an input for function bingo:item_detection/find_slot
#
# @within
# 	function bingo:item_detection/find_slot
# 	function bingo:item_detection/set_overlay
#declare score_holder $item_detect/find_slot.slot_id

data modify storage tmp.bingo:item_detection/set_overlay slots append from storage tmp.bingo:item_detection/set_overlay previousSlots[0]
data remove storage tmp.bingo:item_detection/set_overlay previousSlots[0]

scoreboard players remove $item_detect/find_slot.slot_id bingo.tmp 1
execute if score $item_detect/find_slot.slot_id bingo.tmp matches 0.. run function bingo:item_detection/find_slot