extends CharacterBody2D



const SPEED = -400.0
var obstacle_movement = false



func _physics_process(delta: float) -> void:
	
	if Game_State.game_state == Game_State.game_state_list.START:
		position.x -= 100 * delta * 3
	
		var collision = move_and_collide(velocity * delta)

		if collision:
			Game_State.emit_signal("game_over")


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	self.queue_free()


func _on_area_2d_body_exited(_body:Node2D) -> void:
	if Game_State.game_state == Game_State.game_state_list.START:
		Game_State.emit_signal("point_scored")
