extends Node2D

@onready var player_stats = get_node("/root/Main/Player/SurvivalStats")

func _on_warmth_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("rhybfi")
		player_stats.cold = false


func _on_warmth_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_stats.cold = true
