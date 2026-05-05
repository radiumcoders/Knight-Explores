extends Area2D

@onready var timer: Timer = $Timer
# DELETE the game_manager onready line entirely

func _on_body_entered(body: Node2D) -> void:
	print("you died!!")
	Engine.time_scale = 0.5
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	GameManager.get_hurt() 
