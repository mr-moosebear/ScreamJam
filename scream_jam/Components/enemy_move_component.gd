
# NOTE: This script is a work in progress
class_name CompEnemyMove
extends Node

const move : Dictionary = {
	"left": Vector2(-1, 0),
	"right": Vector2(1, 0),
	"up": Vector2(0, -1),
	"down": Vector2(0, 1)
}

@export var body : CharacterBody2D
@export var speed : float = 50

var moving_direction : String

func _ready() -> void:
	move_up()

func _physics_process(delta: float) -> void:
	body.move_and_slide()


func move_right() -> void:
	body.velocity = move["right"] * speed
	moving_direction = "right"

func move_left() -> void:
	body.velocity = move["left"] * speed
	moving_direction = "left"

func move_up() -> void:
	body.velocity = move["up"] * speed
	moving_direction = "up"

func move_down() -> void:
	body.velocity = move["down"] * speed
	moving_direction = "down"
