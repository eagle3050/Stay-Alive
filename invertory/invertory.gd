extends Resource

class_name Inv
signal update

@export var slots: Array[Inv_slot]

func insert(item: InvItem):
	var item_slots = slots.filter(func(slot): return slot.item == item)
	if not item_slots.is_empty():
		item_slots[0].amount += 1
	else:
		var empty_slots = slots.filter(func(slot): return slot.item == null)
		if !empty_slots.is_empty():
			empty_slots[0].item = item
			empty_slots[0].amount = 1
	update.emit()

func has_amount(item_name: String, amount: int) -> bool:
	var count = 0
	for slot in slots:
		if slot.item and slot.item.name == item_name:
			count += slot.amount
	return count >= amount

func remove_item_by_name(item_name: String, amount: int):
	for slot in slots:
		if amount <= 0: break
		if slot.item and slot.item.name == item_name:
			var remove_count = min(slot.amount, amount)
			slot.amount -= remove_count
			GlobalStats.wood_collected -= remove_count
			amount -= remove_count
			if slot.amount <= 0:
				slot.item = null
