extends CharacterBody2D

var decision = null

func _physics_process(delta: float) -> void:
	if velocity == Vector2(0, 0):
		reverse_direction() # Probably will make a possible directions and pick random from that


func reverse_direction() -> void:
	match $CompEnemyMove.moving_direction:
		"right":
			$CompEnemyMove.move_left()
		"left":
			$CompEnemyMove.move_right()
		"up":
			$CompEnemyMove.move_down()
		"down":
			$CompEnemyMove.move_up()

func decide_left_or_right() -> String:
	var decision = randi_range(1, 10) % 2 == 0
	var str : String
	if decision == true:
		str = "right"
	else:
		str = "left"
	print("Direction to move is ", str)
	return str

func decide_up_or_down() -> String:
	var decision = randi_range(1, 10) % 2 == 0
	var str : String
	if decision == true:
		str = "up"
	else:
		str = "down"
	print("Direction to move is ", str)
	return str

func keep_on_keeping_on() -> bool:
	return randi_range(1, 10) % 2 == 0


func _on_right_area_body_exited(body: Node2D) -> void:
	if !$LeftRaycast.is_colliding():
		decision = decide_left_or_right()
		if decision == "right":
			$CompEnemyMove.move_right()
		else:
			$CompEnemyMove.move_left()
	elif $CompEnemyMove.moving_direction == "up" or $CompEnemyMove.moving_direction == "Down" && $LeftRaycast.is_colliding():
		var yeah = keep_on_keeping_on()
		if yeah == true:
			$CompEnemyMove.move_right()


func _on_left_area_body_exited(body: Node2D) -> void:
	if !$RightRaycast.is_colliding():
		pass
	elif $RightRaycast.is_colliding():
		$CompEnemyMove.move_left()


func _on_upper_area_body_exited(body: Node2D) -> void:
	if !$LowerRaycast.is_colliding():
		decision = decide_up_or_down()
		if decision == "up":
			$CompEnemyMove.move_up()
		else:
			$CompEnemyMove.move_down()
	elif $CompEnemyMove.moving_direction == "right" or $CompEnemyMove.moving_direction == "left" && $LowerRaycast.is_colliding():
		var yeah = keep_on_keeping_on()
		if yeah == true:
			$CompEnemyMove.move_up()


func _on_lower_area_body_exited(body: Node2D) -> void:
	if !$UpperRaycast.is_colliding():
		pass
	elif $UpperRaycast.is_colliding():
		$CompEnemyMove.move_down()
