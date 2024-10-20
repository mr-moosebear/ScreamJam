extends CharacterBody2D

@export var speed = 50

var last_position : Vector2
var moving_direction : String
var last_direction : String

var is_moving = false


const move : Dictionary = {
	"left": Vector2(-1, 0),
	"right": Vector2(1, 0),
	"up": Vector2(0, -1),
	"down": Vector2(0, 1)
}

func _ready() -> void:
	move_down()
	last_position = position

func _process(delta: float) -> void:
	if last_position == position:
		print("Not moving", moving_direction)
		reverse_movement(moving_direction)
	else:
		print("Moving from", last_position, "to", position)
		last_position = position  # Correct assignment

func _physics_process(delta: float) -> void:
	velocity = move[moving_direction] * speed  # Ensure velocity is updated
	move_and_slide()

func reverse_movement(value: String) -> void:
	match value:
		"left":
			move_right()
		"right":
			move_left()
		"up":
			if is_on_ceiling():
				move_right()
			else:
				move_down()
		"down":
			move_up()

func move_right() -> void:
	velocity = move["right"] * speed
	moving_direction = "right"
func move_left() -> void:
	velocity = move["left"] * speed
	moving_direction = "left"
func move_up() -> void:
	velocity = move["up"] * speed
	moving_direction = "up"
func move_down() -> void:
	velocity = move["down"] * speed
	moving_direction = "down"
