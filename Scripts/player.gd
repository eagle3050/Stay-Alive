extends CharacterBody2D

var speed = 200

func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()
