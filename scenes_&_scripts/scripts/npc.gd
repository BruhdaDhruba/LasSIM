extends Node3D

var dialogue_lines = [
	"Hej!",
	"Kan vi få se leg?",
    "Välkommen in!"
]

func interact():
	var dialogue_ui = get_tree().get_root().get_node("Main/DialogueUI")
	dialogue_ui.start_dialogue(dialogue_lines)
