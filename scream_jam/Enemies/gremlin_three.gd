extends CharacterBody2D



func _process(delta: float) -> void:
	if velocity == Vector2(0, 0):
		reverse_movement($CompEnemyMove.moving_direction)
		var possible_moves = possible_direction()
		print(possible_moves)
		print_states()

func reverse_movement(value: String) -> void:
	match value:
		"left":
			$CompEnemyMove.move_right()
		"right":
			$CompEnemyMove.move_left()
		"up":
			$CompEnemyMove.move_down()
		"down":
			$CompEnemyMove.move_up()

func decide() -> bool:
	return randi_range(1, 10) % 2 == 0

func possible_direction() -> Array:
	var movements : Array = []
	if !$RightRaycast.is_colliding():
		movements.append("right")
	if !$LeftRaycast.is_colliding():
		movements.append("left")
	if !$UpRaycast.is_colliding():
		movements.append("up")
	if !$DownRaycast.is_colliding():
		movements.append("down")
	return movements

func raycast_values() -> void:
	print("Right Raycast colliding ", $RightRaycast.is_colliding())
	print("Left Raycast colliding ", $LeftRaycast.is_colliding())
	print("Up Raycast colliding ", $UpRaycast.is_colliding())
	print("Down Raycast colliding ", $DownRaycast.is_colliding())

func print_states() -> void:
	#print("Ceiling is ", is_on_ceiling())
	#print("Floor is ", is_on_floor())
	#print("Wall is ", is_on_wall())
	print("Moving Direction is ", $CompEnemyMove.moving_direction)
	raycast_values()
