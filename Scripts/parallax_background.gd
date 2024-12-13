extends ParallaxBackground



var background_movement = true



func _ready():
	Game_State.connect("game_over", _on_game_over)


func _process(delta: float) -> void:
	
	if background_movement:
		scroll_offset.x -= 100 * delta


func _on_game_over() -> void:
	background_movement = false