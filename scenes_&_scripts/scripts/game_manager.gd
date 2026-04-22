extends Node

var inventory = []
var collected_badges = []
var cleared_pubs = {}
var collected_items = []

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

func add_badge(badge_name):
	if badge_name not in collected_badges:
		collected_badges.append(badge_name)
	print("Badges:", collected_badges)

func has_badge(badge_name):
	return badge_name in collected_badges

func mark_pub_cleared(pub_name):
	cleared_pubs[pub_name] = true
	print("Cleared pubs:", cleared_pubs)

func is_pub_cleared(pub_name):
	return cleared_pubs.get(pub_name, false)
