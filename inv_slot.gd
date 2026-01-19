extends Panel

@onready var item_visuals: Sprite2D = $CenterContainer/Panel/ItemDisplay

func update(item: InvItem):
	if not item:
		item_visuals.visible = false
	else:
		item_visuals.visible = true
		item_visuals.texture = item.texture
