extends Node2D

var hunger = 100
var thirst = 100
var health = 100
var cold = false
@onready var player: CharacterBody2D = $".."
var stat_dmg: int

var started_health_timer = false

func _on_decrease_timer_timeout() -> void:
	hunger = max(0, hunger - 0.05)
	thirst = max(0, thirst - 0.1)

func _process(_delta: float) -> void:
	if (hunger <= 0 or thirst <= 0) and not started_health_timer:
		$HealthTimer.start()
		started_health_timer = true
		
		if hunger <= 0 and thirst <= 0:
			stat_dmg = 3
		elif thirst <= 0:
			stat_dmg = 2
		else:
			stat_dmg = 1
			
	elif hunger > 0 and thirst > 0 and started_health_timer:
		$HealthTimer.stop()
		started_health_timer = false
	if health <= 0:
		player.die()
	
	if GlobalStats.night_time == true:
		stat_dmg = 2
		cold = true
		if $HealthTimer.is_stopped():
			$HealthTimer.start()
	else:
		$HealthTimer.stop()
		cold = false

func _on_health_timer_timeout() -> void:
	started_health_timer = false
	health = max(0, health - stat_dmg)
