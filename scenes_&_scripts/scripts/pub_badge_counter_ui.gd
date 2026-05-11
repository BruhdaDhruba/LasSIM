extends CanvasLayer

@onready var badge_label = $BadgeLabel

func _ready():
	GameManager.badges_changed.connect(update_counter)
	update_counter()

func update_counter():
	var pub_id = GameManager.current_pub_id

	if pub_id == "":
		badge_label.text = "Pub Badges: 0 / 0"
		return

	var display_name = GameManager.get_pub_display_name(pub_id)
	var count = GameManager.get_badge_count_for_pub(pub_id)
	var total = GameManager.get_badge_total_for_pub(pub_id)

	if GameManager.is_pub_cleared(pub_id):
		badge_label.text = "%s Badges: CLEARED" % display_name
	else:
		badge_label.text = "%s Badges: %d / %d" % [display_name, count, total]
