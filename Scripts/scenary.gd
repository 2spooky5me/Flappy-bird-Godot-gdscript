extends Node2D


@onready var obstacle = preload("res://Scenes/obstacle.tscn")


func _on_timer_timeout() -> void:
	var obstacle_instance = obstacle.instantiate()
	obstacle_instance.position = Vector2(1196, 304)
	self.add_child(obstacle_instance)
