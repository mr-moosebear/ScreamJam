# Grabs player input per frame processed and passes it to the relevant 
# components

class_name CompCharacterInput

extends Node

# Handles movement inputs
@export var comp_character_move : CompCharacterInput

func _physics_process(_delta: float) -> void:
	var input_vector : Vector2 = Input.get_vector("left", "right", "up", "down")
	comp_character_move.input_move(input_vector)
