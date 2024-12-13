class_name GameState
extends Node



enum game_state_list {
    START,
    OVER,
    RESTART
}

var highest_score = 0
var game_state = game_state_list.OVER
var player_has_control = false

signal game_started 
signal game_over
signal point_scored 