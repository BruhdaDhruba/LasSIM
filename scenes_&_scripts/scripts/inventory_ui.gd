extends CanvasLayer

@onready var label = $Panel/Label

var is_open = false

func _ready():
	hide()

func _input(event):
	if event.is_action_pressed("inventory"):
		toggle_inventory()

func toggle_inventory():
	is_open = !is_open

	if is_open:
		update_inventory_text()
		show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().call_group("player", "disable_movement")
	else:
		hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		get_tree().call_group("player", "enable_movement")

func update_inventory_text():
	var text = "INVENTORY\n\n"

	text += "Items:\n"
	if GameManager.inventory.size() == 0:
		text += "- None\n"
	else:
		for item in GameManager.inventory:
			text += "- %s\n" % item

	text += "\nBadges:\n"

	var pubs = ["bengtpub", "bitchespub", "murphypub"]

	for pub_id in pubs:
		var count = GameManager.get_badge_count_for_pub(pub_id)
		var total = GameManager.get_badge_total_for_pub(pub_id)
		text += "%s: %d / %d\n" % [pub_id.capitalize(), count, total]

	label.text = text
