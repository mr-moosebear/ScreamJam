class_name CompIsMoving
extends Node

@export var body : CharacterBody2D
var is_moving : bool = true

func _physics_process(delta: float) -> void:
	if body.velocity == Vector2(0, 0):
		is_moving = false
