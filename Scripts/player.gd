extends CharacterBody2D

@export var inv: Inv
var speed = 100
var campfire_selected = false
@onready var animated_sprite: AnimatedSprite2D = $Holder/AnimatedSprite2D









func _process(_delta: float) -> void:
	#placing_items()
	handle_anim()
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()
	if Input.is_action_just_pressed("debug"):
		inv.append()

func handle_anim():
	if Input.is_action_just_pressed("left"):
		animated_sprite.play("side")
		animated_sprite.flip_h = true
	elif Input.is_action_just_pressed("right"):
		animated_sprite.play("side")
		animated_sprite.flip_h = false
	if Input.is_action_just_pressed("down"):
		animated_sprite.play("down")
	elif Input.is_action_just_pressed("up"):
		animated_sprite.play("up")

func die():
	hide()
	print("dead")
	
#func placing_items():
	#
	#var campfire = preload("res://Scenes/campfire.tscn")
	##INVERTORY CHECKING IF ENOUGH MATERIALS LOGIC
	#if Input.is_action_just_pressed("1"):
		#print("selectg")
		#campfire_selected = true
	#if Input.is_action_just_pressed("place") and campfire_selected: #AND ENOUGH MATERIALS
		#var campfire_scene = campfire.instantiate()
		#var mouse_pos = get_global_mouse_position()
		#campfire_scene.global_position = mouse_pos
		#get_parent().add_child(campfire_scene)


func _input(event):
	if event.is_action_pressed("place"): # Or whatever your "Place" button is
		use_item()
var selected_slot_index: int = 0 # This should be updated by your Hotbar/UI logic
func use_item():
	var slot = inv.slots[selected_slot_index]
	
	if slot and slot.item:
		# Check if the item is a Campfire or Base
		if slot.item.name == "Campfire":
			place_object(preload("res://Scenes/campfire.tscn"))
			consume_selected_item(slot)
		#elif slot.item.name == "Base":
			#place_object(preload("res://scenes/base.tscn"))
			#consume_selected_item(slot)

func place_object(object_scene: PackedScene):
	var instance = object_scene.instantiate()
	# Set the position to slightly in front of the player
	instance.global_position = global_position
	get_parent().add_child(instance)

func consume_selected_item(slot: Inv_slot):
	slot.amount -= 1
	if slot.amount <= 0:
		slot.item = null
	
	# Emit a signal so the UI knows to refresh the numbers
	inv.update.emit()



		
func collect(item):
	inv.insert(item)
