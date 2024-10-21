# Checks if the character is stuck 
class_name CompPositionCheck
extends Node

@export var body : CharacterBody2D
var last_position : Vector2
var is_moving : bool = false


func _process(delta: float) -> void:
	if last_position == body.position:
		print("Not moving")
	else:
		print("Moving from ", last_position, " to ", body.position)
		last_position = body.position
