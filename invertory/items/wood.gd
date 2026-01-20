extends Area2D

@onready var player = get_node("/root/Main/Player")
@export var item: InvItem
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.collect(item)
		GlobalStats.wood_collected += 1
		hide()
func _ready() -> void:
	rotation = randf_range(-90, 180)

	var max_offset = 3.0
	
	# Generate random float between -50 and 50 for X and Y
	var random_x = randf_range(-max_offset, max_offset)
	var random_y = randf_range(-max_offset, max_offset)
	
	# Apply the offset to the current position
	position += Vector2(random_x, random_y)
