extends Node3D

@export var target_scene: String = ""

func interact():
	if target_scene != "":
		get_tree().change_scene_to_file(target_scene)
