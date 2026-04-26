extends Node

var inventory = []
var collected_badges = []
var cleared_pubs = {}
var collected_items = []
var next_spawn_id = ""
var pub_badge_totals = {
	"bengtpub": 3,
	"bitchespub": 3,
	"murphypub": 3
}
signal badges_changed

func get_badge_count_for_pub(pub_id):
	var count = 0
	for badge_id in collected_badges:
		if badge_id.begins_with(pub_id + "_"):
			count += 1
	return count

func get_badge_total_for_pub(pub_id):
	return pub_badge_totals.get(pub_id, 0)

func mark_item_collected(item_id):
	if item_id not in collected_items:
		collected_items.append(item_id)

func is_item_collected(item_id):
	return item_id in collected_items

func add_item(item_name):
	if item_name not in inventory:
		inventory.append(item_name)
	print("Inventory:", inventory)

func has_item(item_name):
	return item_name in inventory

func add_badge(badge_id):
	if badge_id not in collected_badges:
		collected_badges.append(badge_id)
		badges_changed.emit()
	print("Badges:", collected_badges)

func has_badge(badge_name):
	return badge_name in collected_badges
	
func badge_count():
	return collected_badges.size()

func mark_pub_cleared(pub_name):
	cleared_pubs[pub_name] = true
	print("Cleared pubs:", cleared_pubs)

func is_pub_cleared(pub_name):
	return cleared_pubs.get(pub_name, false)
