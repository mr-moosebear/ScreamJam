extends CharacterBody2D

@export var speed = 100

var last_position : Vector2
var moving_direction : String
var is_moving = false


const move : Dictionary = {
	"left": Vector2(-1, 0),
	"right": Vector2(1, 0),
	"up": Vector2(0, -1),
	"down": Vector2(0, 1)
}

func _ready() -> void:
	moving_direction = "down"
	velocity = move[moving_direction] * speed
	last_position = position

func _process(delta: float) -> void:
	if last_position == position:
		print("Not moving")
	else:
		print("Moving from", last_position, "to", position)
		last_position = position  # Correct assignment


func _physics_process(delta: float) -> void:
	velocity = move[moving_direction] * speed  # Ensure velocity is updated
	move_and_slide()
