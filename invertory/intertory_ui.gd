extends Control

var is_open = false
@onready var inv: Inv = preload("res://invertory/player_inv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
@export var campfire_item: InvItem # Drag your Campfire Resource here
@export var player_inventory: Inv
@onready var player = get_node("/root/Main/Player")

func _ready() -> void:
	inv.update.connect(update_slots)
	update_slots()
	open()
	#close()
	
func _process(delta: float) -> void:

	if GlobalStats.wood_collected >= 10:
		$CraftCampfire.show()
	else:
		$CraftCampfire.hide()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])

func open():
	visible = true
	is_open = true

#func close():
	#visible = false
	#is_open = false


func _on_craft_campfire_pressed():
	var wood_needed = 5
	
	if player_inventory.has_amount("Wood", wood_needed):
		player_inventory.remove_item_by_name("Wood", wood_needed)
		
		player_inventory.insert(campfire_item)
		
		update_slots() 
		print("Crafted a Campfire!")
	else:
		print("Not enough Wood!")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("1"):
		print("0")
		player.selected_slot_index = 0
	if Input.is_action_just_pressed("2"):
		print("2")
		player.selected_slot_index = 1
	if Input.is_action_just_pressed("3"):
		print("3")
		player.selected_slot_index = 2
	if Input.is_action_just_pressed("4"):
		print("4")
		player.selected_slot_index = 3
	if Input.is_action_just_pressed("5"):
		print("5")
		player.selected_slot_index = 4
	if Input.is_action_just_pressed("6"):
		print("6")
		player.selected_slot_index = 5
