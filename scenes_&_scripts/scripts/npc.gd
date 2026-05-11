extends Node3D

@export var npc_name = "NPC"
@export var dialogue_lines = [
	"Hej!",
	"Kan vi få se leg?",
	"Välkommen in!"
]

@onready var name_label = $NameLabel

func _ready():
	name_label.text = npc_name

func interact():
	var dialogue_ui = get_tree().get_root().get_node("Main/DialogueUI")

	if dialogue_ui == null:
		dialogue_ui = get_tree().get_first_node_in_group("dialogue_ui")

	if dialogue_ui:
		dialogue_ui.start_dialogue(dialogue_lines)
