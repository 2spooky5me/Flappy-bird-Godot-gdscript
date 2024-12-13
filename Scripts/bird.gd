extends CharacterBody2D



const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var crash_sound = preload("res://Assets/Sounds/hit.ogg")
var game_started = true


func _ready():
	Game_State.connect("game_over", _on_game_over)


func _physics_process(delta: float) -> void:
	
	if Game_State.game_state == Game_State.game_state_list.START and Game_State.player_has_control:
		velocity += get_gravity() * delta

		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_VELOCITY
			$AudioStreamPlayer2D.play()

		var collision = move_and_collide(velocity * delta)

		if collision:
			Game_State.emit_signal("game_over")


func _on_game_over() -> void:
	Game_State.game_state = Game_State.game_state_list.OVER
	Game_State.player_has_control = false
	$AnimFades.play("crash")
	$AnimFly.stop()
	$AudioStreamPlayer2D.stream = crash_sound
	$AudioStreamPlayer2D.play()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up") and Game_State.game_state == Game_State.game_state_list.START and game_started:
		Game_State.emit_signal("game_started")
		Game_State.player_has_control = true
		game_started = false