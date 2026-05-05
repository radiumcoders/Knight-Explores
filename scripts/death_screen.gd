extends Node2D

func _ready():
	$Label.text = "REVIVE NOW"
	$Button.pressed.connect(_on_button_pressed)  # connects signal in code
	print("death screen loaded")  # to confirm scene is working

func _on_button_pressed():
	print("button clicked!")  # to confirm button works
	GameManager.life_left = 3
	GameManager.score = 0
	get_tree().change_scene_to_file("res://scenes/game.tscn")
