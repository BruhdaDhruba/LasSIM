extends Node3D

@export_file("*.tscn") var target_scene: String = ""
@export var target_spawn_id = ""

func interact():
	if target_scene != "":
		GameManager.next_spawn_id = target_spawn_id
		call_deferred("_change_scene")

func _change_scene():
	get_tree().change_scene_to_file(target_scene)
