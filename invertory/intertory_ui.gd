extends Control

var is_open = false
@onready var inv: Inv = preload("res://invertory/player_inv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready() -> void:
	inv.update.connect(update_slots)
	update_slots()
	close()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("e"):
		if is_open:
			close()
		else:
			open()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
