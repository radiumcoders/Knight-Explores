extends Node

var score = 0
var life_left = 3
var spawn_position: Vector2  # add this

func get_hurt():
	life_left -= 1
	print("u lost a life, lives left: " + str(life_left))
	if life_left <= 0:
		#print("dead")
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
		return
	# teleport instead of reloading:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.position = spawn_position

func add_point():
	score += 1
	print(score)
