extends KinematicBody2D

const ACCELERATION_RATE = 10
const MAX_PLAYER_SPEED = 100
const FRICTION_RATE = 2.5

func _ready():
	print("Hello godot!")

var velocity = Vector2.ZERO

func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	direction = direction.normalized()

	if direction != Vector2.ZERO :
		velocity += direction * ACCELERATION_RATE * delta
		velocity = velocity.clamped(MAX_PLAYER_SPEED * delta)
	else :
		velocity = velocity.move_toward(Vector2.ZERO,FRICTION_RATE * delta)
	print(velocity)
	move_and_collide(velocity)
