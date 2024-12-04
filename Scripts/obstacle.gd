extends CharacterBody2D


const SPEED = -400.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	velocity.x = SPEED
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		get_tree().quit()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	self.queue_free()
