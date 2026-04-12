extends Node

var items = []

func add_item(item_name):
	items.append(item_name)
	print("Picked up:", item_name)
	print("Inventory:", items)

func has_item(item_name):
	return item_name in items
