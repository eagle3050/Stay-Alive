extends CharacterBody2D

@export var inv: Inv
var speed = 100
var campfire_selected = false
@onready var animated_sprite: AnimatedSprite2D = $Holder/AnimatedSprite2D









func _process(_delta: float) -> void:
	placing_items()
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
	
func placing_items():
	
	var campfire = preload("res://Scenes/campfire.tscn")
	#INVERTORY CHECKING IF ENOUGH MATERIALS LOGIC
	if Input.is_action_just_pressed("1"):
		print("selectg")
		campfire_selected = true
	if Input.is_action_just_pressed("place") and campfire_selected: #AND ENOUGH MATERIALS
		var campfire_scene = campfire.instantiate()
		var mouse_pos = get_global_mouse_position()
		campfire_scene.global_position = mouse_pos
		get_parent().add_child(campfire_scene)
		
		
func collect(item):
	inv.insert(item)
