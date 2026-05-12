extends Node

@export var npc_scene: PackedScene

@onready var spawn_al = $"../NPCSpawns/Spawn_AL"
@onready var spawn_sa = $"../NPCSpawns/Spawn_SA"
@onready var spawn_bar = $"../NPCSpawns/Spawn_Bar"

var pub_npcs = {
	"bengtpub": [
		{
			"name": "Vurpan",
			"spawn": "al",
			"dialogue": ["Jag är AL på Bengtpub.", "Håll koll på märkena!"]
		},
		{
			"name": "Viking",
			"spawn": "sa",
			"dialogue": ["SA Viking här.", "Visa mecenat sen, okej?"]
		},
		{
			"name": "Samba",
			"spawn": "bar",
			"dialogue": ["Välkommen till baren.", "Bengtpub levererar."]
		}
	],

	"bitchespub": [
		{
			"name": "Toppen",
			"spawn": "al",
			"dialogue": ["Jag är AL på Bitchespub.", "Stöka inte för mycket."]
		},
		{
			"name": "SUL SUL",
			"spawn": "sa",
			"dialogue": ["SUL SUL.", "Det där lät nästan som ett språk."]
		},
		{
			"name": "Lyset",
			"spawn": "bar",
			"dialogue": ["Baren är öppen.", "Vad vill du ha?"]
		}
	],

	"murphypub": [
		{
			"name": "Guldlock",
			"spawn": "al",
			"dialogue": ["Jag är AL på Murphypub.", "Allt går enligt plan. Kanske."]
		},
		{
			"name": "Eminem",
			"spawn": "sa",
			"dialogue": ["SA Eminem här.", "Lose yourself i pubben."]
		},
		{
			"name": "Waka",
			"spawn": "bar",
			"dialogue": ["Waka waka.", "Baren är redo."]
		}
	]
}

func _ready():
	spawn_pub_npcs()

func spawn_pub_npcs():
	var pub_id = GameManager.current_pub_id

	if pub_id == "":
		print("No current_pub_id set.")
		return

	if not pub_npcs.has(pub_id):
		print("No NPC data for pub:", pub_id)
		return

	for npc_data in pub_npcs[pub_id]:
		spawn_npc(npc_data)

func spawn_npc(npc_data):
	if npc_scene == null:
		print("No NPC scene assigned in PubManager.")
		return

	var npc = npc_scene.instantiate()

	var spawn_point = get_spawn_point(npc_data["spawn"])
	if spawn_point == null:
		print("Missing spawn point:", npc_data["spawn"])
		return

	get_parent().add_child.call_deferred(npc)

	npc.call_deferred("set_global_position", spawn_point.global_position)
	npc.call_deferred("set_global_rotation", spawn_point.global_rotation)

	npc.npc_name = npc_data["name"]
	npc.dialogue_lines = npc_data["dialogue"]

	print("Spawned NPC:", npc_data["name"])

func get_spawn_point(spawn_id):
	match spawn_id:
		"al":
			return spawn_al
		"sa":
			return spawn_sa
		"bar":
			return spawn_bar
		_:
			return null
