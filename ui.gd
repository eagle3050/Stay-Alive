extends CanvasLayer

@onready var hunger: Label = $Stats/Hunger
@onready var thirst: Label = $Stats/Thirst
@onready var health: Label = $Stats/Health

@onready var player_stats = get_node("/root/Main/Player/SurvivalStats")

func _process(delta: float) -> void:
	hunger.text = str("Hunger: ", round(player_stats.hunger))
	thirst.text = str("Thirst: ", round(player_stats.thirst))
	health.text = str("Health: ", round(player_stats.health))
