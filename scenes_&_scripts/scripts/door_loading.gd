extends Control

@export var loading_time = 2.0
@export_file("*.tscn") var pub_scene = "res://scenes_&_scripts/pub_base.tscn"

var possible_pubs = [
	"bengtpub",
	"bitchespub",
	"murphypub"
]

func _ready():
	var selected_pub = possible_pubs.pick_random()
	GameManager.current_pub_id = selected_pub
	GameManager.next_spawn_id = "from_main"

	print("Selected pub:", selected_pub)

	await get_tree().create_timer(loading_time).timeout
	get_tree().change_scene_to_file(pub_scene)
