extends Node3D

@export_file("*.tscn") var target_scene: String = ""

func interact():
	if target_scene != "":
		call_deferred("_change_scene")

func _change_scene():
	get_tree().change_scene_to_file(target_scene)
