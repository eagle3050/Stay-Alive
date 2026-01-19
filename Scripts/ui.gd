extends CanvasLayer

@onready var hunger: Label = $Stats/Hunger
@onready var thirst: Label = $Stats/Thirst
@onready var health: Label = $Stats/Health
@onready var cold: Label = $Stats/Cold
@onready var day_counter: Label = $Stats/DayCounter

@onready var player_stats = get_node("/root/Main/Player/SurvivalStats")

func _process(delta: float) -> void:
	hunger.text = str("Hunger: ", round(player_stats.hunger))
	thirst.text = str("Thirst: ", round(player_stats.thirst))
	health.text = str("Health: ", round(player_stats.health))
	day_counter.text = str("Day: ", GlobalStats.day)
	if player_stats.cold:
		cold.show()
	else:
		cold.hide()
