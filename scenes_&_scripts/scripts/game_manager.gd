extends Node

var inventory = []
var collected_badges = []
var cleared_pubs = {}

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
