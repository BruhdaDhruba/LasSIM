extends CanvasLayer

@onready var label = $Panel/Label

var dialogue_lines = []
var current_line = 0
var active = false

func _ready():
	hide()

func start_dialogue(lines):
	dialogue_lines = lines
	current_line = 0
	active = true
	show()
	label.text = dialogue_lines[current_line]
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().call_group("player", "disable_movement")

func _input(event):
	if active and event.is_action_pressed("interact"):
		current_line += 1
		if current_line >= dialogue_lines.size():
			end_dialogue()
		else:
			label.text = dialogue_lines[current_line]

func end_dialogue():
	active = false
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().call_group("player", "enable_movement")
	get_tree().call_group("player", "set_interact_cooldown", 0.2)
	
func is_active():
	return active
