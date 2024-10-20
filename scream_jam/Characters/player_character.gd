
extends CharacterBody2D

@export var speed = 200.0

func get_input():
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction == Vector2(1, 0):
		velocity = direction * speed
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
		
	elif direction == Vector2(-1, 0):
		velocity = direction * speed
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")

	elif direction == Vector2(0, -1):
		velocity = direction * speed
		$AnimatedSprite2D.play("walk_up")
	
	elif direction == Vector2(0, 1):
		velocity = direction * speed
		$AnimatedSprite2D.play("walk_down")
	else:
		velocity = Vector2(0, 0)
		$AnimatedSprite2D.play("idle")

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
