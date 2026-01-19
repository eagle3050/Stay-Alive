extends Node2D

@onready var player_stats = get_node("/root/Main/Player/SurvivalStats")

func _ready() -> void:
	$World/DayTimer.start()

func _on_day_timer_timeout() -> void:
	player_stats.cold = true
	GlobalStats.night_time = true
	$Player/Camera2D/Night.show()
	
	$World/NightTimer.start()


func _on_night_timer_timeout() -> void:
	player_stats.cold = false
	GlobalStats.day += 1
	GlobalStats.night_time = false
	$Player/Camera2D/Night.hide()
	
	$World/DayTimer.start()
