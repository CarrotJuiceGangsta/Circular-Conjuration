extends Node3D

@onready var item_list: ItemList = $"../UI/ItemList"

const ICON = preload("uid://ctf1dnm8led2g")

var selection = 0

var inventory_space = 3

var health_potion_key = "health_potion"

func _process(_delta: float) -> void:
	print(Game.Health)
	if Input.is_action_just_pressed("1"):
		if item_list.get_item_text(0) == health_potion_key:
			item_list.remove_item(0)
			Game.Health += 10


	if Input.is_action_just_pressed("add_potion") and item_list.item_count < inventory_space:
		item_list.add_item("health_potion", ICON, true)


	if Input.is_action_just_pressed("scroll_up") and item_list.item_count > 1:
		if selection >= item_list.item_count - 1:
			selection = 0
		elif selection < item_list.item_count - 1:
			selection += 1
		item_list.select(selection)



	if Input.is_action_just_pressed("scroll_down") and item_list.item_count > 1:
		if selection <= 0:
			selection = item_list.item_count - 1
		elif selection > 0:
			selection -= 1
		item_list.select(selection)
