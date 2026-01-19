extends CharacterBody2D

var speed = 100
@onready var animated_sprite: AnimatedSprite2D = $Holder/AnimatedSprite2D

func _process(_delta: float) -> void:
	handle_anim()
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()

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
	
func placing_campfire():
	var campfire = preload("res://campfire.tscn")
	#INVERTORY CHECKING IF ENOUGH MATERIALS LOGIC
	if Input.is_action_just_pressed("place"): #AND ENOUGH MATERIALS
		var campfire_scene = campfire.instantiate()
		campfire_scene.global_position = get_global_mouse_position()
		get_parent().add_child(campfire)
