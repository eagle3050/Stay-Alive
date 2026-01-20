extends Area2D

@onready var player = get_node("/root/Main/Player")
@export var item: InvItem
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.collect(item)
		hide()
