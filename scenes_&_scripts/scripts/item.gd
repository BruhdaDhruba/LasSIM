extends Node3D

@export var item_name = "Nachos"
@export var item_id = "nachos_main"

func _ready():
	# If already collected, remove immediately
	if GameManager.is_item_collected(item_id):
		queue_free()

func interact():
	GameManager.add_item(item_name)
	GameManager.mark_item_collected(item_id)
	queue_free()
