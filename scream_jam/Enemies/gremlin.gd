extends CharacterBody2D

@export var speed = 100
@export var area_detected = false
var is_stopped : bool = false


var raycast_result : Dictionary = {}
var move = Vector2(0, 0)
var player_position = Vector2.ZERO
var last_position = Vector2.ZERO


func _physics_process(delta):
	if area_detected == true:
		raycast_result = raycast_dictionary()

		if velocity == Vector2(0, 0):
			print("Have no velocity ", velocity, " Switching Directions")
			is_stopped = true

		if is_stopped == true:
			var v = reverse_vector(raycast_result["normal"])
			switch_directions(v)
			
		if raycast_result.collider.name == "PlayerCharacter":
			enemy_move(raycast_result.normal)
			#print("Hit point: ", raycast_result.position)

		area_detected = false
	move_and_slide()

func raycast_dictionary() -> Dictionary:
	var space_rid = get_world_2d().space
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(global_position, player_position)#Use the global position not the local 
	var result = space_state.intersect_ray(query)
	return result


func enemy_move(norm: Vector2) -> void:
	velocity = -norm * speed

func switch_directions(norm: Vector2) -> void:
	velocity = norm * speed

func reverse_vector(v: Vector2) -> Vector2:
	return Vector2(-v.y, v.x)


func _on_area_2d_body_entered(body: Node2D) -> void:
	area_detected = true
	player_position = body.global_position
