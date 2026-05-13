extends Node3D

@export var item_name = "Nachos"
@export var item_id = "nachos"
@export var pub_specific = true
@export var available_in_pubs: Array[String] = []

@export var item_color: Color = Color.WHITE

@onready var mesh: MeshInstance3D = $MeshInstance3D

var final_item_id = ""

func _ready():
	apply_color()

	var current_pub = GameManager.current_pub_id

	if available_in_pubs.size() > 0 and current_pub not in available_in_pubs:
		queue_free()
		return

	if pub_specific:
		final_item_id = "%s_%s" % [current_pub, item_id]
	else:
		final_item_id = item_id

	if GameManager.is_item_collected(final_item_id):
		queue_free()

func apply_color():
	print("Applying color to:", item_name, item_color)
	var material := StandardMaterial3D.new()
	material.albedo_color = item_color
	mesh.set_surface_override_material(0, material)

func interact():
	GameManager.add_item(item_name)
	GameManager.mark_item_collected(final_item_id)
	print("Collected item ID:", final_item_id)
	queue_free()
