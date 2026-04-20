extends Node3D

@export var item_name = "Nachos"

func interact():
	GameManager.add_item(item_name)
	queue_free()
