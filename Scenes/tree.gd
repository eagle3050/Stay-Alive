extends StaticBody2D

@export var item: InvItem
var broken = true
@onready var wood_scene = preload("res://invertory/items/wood.tscn")
@onready var player = get_node("/root/Main/Player")

func _on_break_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		broken = true
		$Holder.hide()
		for i in randf_range(1, 3):
			var wood = wood_scene.instantiate()
			
			wood.global_position = $WoodSpawn.global_position
			get_parent().add_child(wood)
		queue_free()
		
