extends Node2D


@onready var obstacle = preload("res://Scenes/obstacle.tscn")
@onready var bird = preload("res://Scenes/bird.tscn")
var start = false

func _ready():
	$Control/Label.visible = false
	Game_State.connect("game_started", _on_bird_game_started)
	Game_State.connect("point_scored", _on_obstacle_point_scored)
	Game_State.connect("game_over", _on_bird_game_over)


func _on_bird_game_started() -> void:
	start = true
	$Control/Label.text = str(int(0))
	$Control/Label2.visible = false
	$Control/Label.visible = true


func _on_timer_timeout() -> void:
	if start:
		var obstacle_instance = obstacle.instantiate()
		obstacle_instance.position = Vector2(1196, randf_range(200,400))
		self.add_child(obstacle_instance)


func _on_obstacle_point_scored() -> void:
	$Control/Label.text = str(int($Control/Label.text) + 1)


func _on_bird_game_over() -> void:
	var obstacle_list:Array = get_tree().get_nodes_in_group("obstacle")
	for obstacles in obstacle_list:
		obstacles.queue_free()
	start = false
	$Control/Label2.text = "Game over, press up to restart"
	$Control/Label2.visible = true
	$Control/Label.visible = false
	var bird_instance = bird.instantiate()
	bird_instance.position = Vector2(80, 304)
	self.add_child(bird_instance)