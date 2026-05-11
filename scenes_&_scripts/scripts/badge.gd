extends Node3D

@export var badge_number = 1
@export var badge_name = "Pub Badge"

var badge_id = ""

func _ready():
	var pub_id = GameManager.current_pub_id
	badge_id = "%s_badge%d" % [pub_id, badge_number]

	if GameManager.has_badge(badge_id):
		queue_free()

func interact():
	GameManager.add_badge(badge_id)

	var display_name = GameManager.get_pub_display_name(GameManager.current_pub_id)
	print("Collected badge:", display_name, "Badge", badge_number)

	queue_free()
