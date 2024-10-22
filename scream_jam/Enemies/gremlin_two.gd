extends CharacterBody2D
# TODO: Make a decision when both left/right exit on choosing left or right

func _physics_process(delta: float) -> void:
	if velocity == Vector2(0, 0):
		reverse_direction() # Probably will make a possible directions and pick random from that


func reverse_direction() -> void:
	match $CompEnemyMove.moving_direction:
		"right":
			print("Move left")
			$CompEnemyMove.move_left()
		"left":
			print("Move right")
			$CompEnemyMove.move_right()
		"up":
			print("Move down")
			$CompEnemyMove.move_down()
		"down":
			print("Move up")
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

func _on_right_area_body_exited(body: Node2D) -> void:
	var decision = decide_left_or_right()
	
	if $CompEnemyMove.moving_direction != "left" && $CompEnemyMove.moving_direction != "right":
		if decision == "right":
			$CompEnemyMove.move_right()
		else:
			$CompEnemyMove.move_left()
	elif $CompEnemyMove.moving_direction != "left":
		$CompEnemyMove.move_right()


func _on_left_area_body_exited(body: Node2D) -> void:
	if $CompEnemyMove.moving_direction != "right":
		#$CompEnemyMove.move_left()
		print("Do we need a left ")

func _on_upper_area_body_exited(body: Node2D) -> void:
	if $CompEnemyMove.moving_direction != "down":
		$CompEnemyMove.move_up()

func _on_lower_area_body_exited(body: Node2D) -> void:
	if $CompEnemyMove.moving_direction != "up":
		$CompEnemyMove.move_down()
