extends Node



const game_arena = preload("res://Scenes/scenary.tscn")
const game_UI = preload("res://Scenes/UI.tscn")



func _on_animation_player_animation_finished(anim_name:StringName) -> void:

    if anim_name == "fade_in_screen":
        var scenary = get_tree().get_first_node_in_group("scenary")
        var UI = get_tree().get_first_node_in_group("UI")
        scenary.queue_free()
        UI.queue_free()
        self.add_child(game_arena.instantiate())
        self.add_child(game_UI.instantiate())
        $AnimationPlayer.play("fade_out_screen")


func _input(event):
	
    if event.is_action_pressed("ui_up") and Game_State.game_state == Game_State.game_state_list.OVER and Game_State.player_has_control:
        $AnimationPlayer.play("fade_in_screen")
        $AudioStreamPlayer2D.play()
        Game_State.player_has_control = false