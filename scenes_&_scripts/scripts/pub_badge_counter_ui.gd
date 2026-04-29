extends CanvasLayer

@onready var badge_label = $BadgeLabel

@export var pub_id = "bengtpub"
@export var pub_display_name = "Bengtpub"

func _ready():
	GameManager.badges_changed.connect(update_counter)
	update_counter()

func update_counter():
	var count = GameManager.get_badge_count_for_pub(pub_id)
	var total = GameManager.get_badge_total_for_pub(pub_id)

	if GameManager.is_pub_cleared(pub_id):
		badge_label.text = "%s Badges: CLEARED" % pub_display_name
	else:
		badge_label.text = "%s Badges: %d / %d" % [pub_display_name, count, total]
