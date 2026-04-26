extends Node3D

@export var badge_id = "badge_test"
@export var badge_name = "Test Badge"

func _ready():
	if GameManager.has_badge(badge_id):
		queue_free()

func interact():
	GameManager.add_badge(badge_id)
	print("Collected badge:", badge_name)
	queue_free()
