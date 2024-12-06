extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var start = false


func _ready():
	Game_State.connect("game_over", _on_game_over)


func _physics_process(delta: float) -> void:

	if start:
		velocity += get_gravity() * delta

		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_VELOCITY

	var collision = move_and_collide(velocity * delta)

	if collision:
		Game_State.emit_signal("game_over")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up") and start == false:
		Game_State.emit_signal("game_started")
		start = true


func _on_game_over() -> void:
	self.queue_free()