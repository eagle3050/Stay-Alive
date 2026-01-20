extends Panel

@onready var item_visuals: Sprite2D = $CenterContainer/Panel/ItemDisplay
@onready var amount_text: Label = $CenterContainer/Panel/Label

func update(slot: Inv_slot):
	if not slot.item:
		item_visuals.visible = false
		amount_text.visible = false
	else:
		
		amount_text.text = str(slot.amount)
		if slot.amount > 1:
			amount_text.visible = true
		item_visuals.visible = true
		item_visuals.texture = slot.item.texture
