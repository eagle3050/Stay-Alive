extends Node2D


func _ready() -> void:
	$World/DayTimer.start()

func _on_day_timer_timeout() -> void:
	GlobalStats.night_time = true
	$Player/Camera2D/Night.show()
	
	$World/NightTimer.start()


func _on_night_timer_timeout() -> void:
	GlobalStats.day += 1
	GlobalStats.night_time = false
	$Player/Camera2D/Night.hide()
	
	$World/DayTimer.start()
