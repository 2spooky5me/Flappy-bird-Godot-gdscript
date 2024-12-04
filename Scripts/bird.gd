extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:

	velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_up"):
		velocity.y = JUMP_VELOCITY

	var collision = move_and_collide(velocity * delta)

	if collision:
		get_tree().quit()
