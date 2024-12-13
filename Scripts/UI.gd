extends Control



var player_has_control = false



func _ready() -> void:
	Game_State.connect("game_started", _on_game_started)
	Game_State.connect("point_scored", _on_point_scored)
	Game_State.connect("game_over", _on_game_over)
	$Label.hide()


func _on_game_started() -> void:
	$Label.show()
	$Label2.hide()


func _on_point_scored() -> void:
	$Label.text = str(int($Label.text) + 1)


func _on_game_over() -> void:
	$Label3.text = "GAME OVER!\n\nROUND SCORE: " + $Label.text + "\n\nHIGHEST SCORE: " + str(Game_State.highest_score) + "\n\nTO RESTART PRESS UP"

	if int($Label.text) > Game_State.highest_score:
		Game_State.highest_score = int($Label.text)
		$Label3.text = "GAME OVER!\n\nROUND SCORE: " + $Label.text + "\n\nNEW HIGH SCORE!: " + str(Game_State.highest_score) + "\n\nTO RESTART PRESS UP"

	$AnimationPlayer.play("fade_out_score")


func _on_animation_player_animation_finished(anim_name:StringName) -> void:

	if anim_name == "fade_out_score":
		$AnimationPlayer.play("jump_in_game_over")

	if anim_name == "jump_in_game_over":
		Game_State.player_has_control = true

	if anim_name == "fade_in_welcome_title":
		Game_State.game_state = Game_State.game_state_list.START