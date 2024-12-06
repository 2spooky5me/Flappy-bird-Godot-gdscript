extends Node


signal game_started # Used by "bird.gd" to determine when the player pressed the up arrow button.
signal game_over # Used by "bird.gd" to determine when the player character collided with an obstacle.
signal point_scored # Used by the "obstacle.gd" to determine when the player character succesfully passed it.