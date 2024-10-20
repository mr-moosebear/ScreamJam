class_name CompCharacterMove

extends Node

@export var character : CharacterBody2D = null
@export var friction_coefficient : float = 0.25
@export var character_speed : float = 64.0

var movement_vector : Vector2

func _ready() -> void:
	if character == null and get_parent() is CharacterBody2D:
		character = get_parent()
   
func _physics_process(_delta : float) -> void:
	character.velocity = movement_vector
	character.move_and_slide()

func accelerate(force : Vector2, friction : float) -> void:
	movement_vector = lerp(movement_vector, force, friction)
	pass
	
func input_move(direction : Vector2) -> void:
	accelerate(direction * character_speed, friction_coefficient)    

func push(force : Vector2) -> void:
	movement_vector += force
	pass
