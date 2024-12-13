extends Node2D



@onready var obstacle = preload("res://Scenes/obstacle.tscn")
@onready var bird = preload("res://Scenes/bird.tscn")



func _ready():
	Game_State.connect("game_started", _on_game_started)
	Game_State.connect("game_over", _on_game_over)
	Game_State.connect("point_scored", _on_point_scored)


func _on_timer_timeout() -> void:
	var obstacle_instance = obstacle.instantiate()
	obstacle_instance.position = Vector2(1196, randf_range(200,400))
	self.add_child(obstacle_instance)


func _on_game_started() -> void:
	$Timer.start()


func _on_point_scored() -> void:
	$AudioStreamPlayer2D.play()


func _on_game_over() -> void:
	$Timer.stop()