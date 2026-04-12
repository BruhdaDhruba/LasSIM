extends Node3D

@export var item_name = "Nachos"

func interact():
	var inventory = get_tree().get_first_node_in_group("inventory")
	if inventory:
		inventory.add_item(item_name)
	queue_free()
