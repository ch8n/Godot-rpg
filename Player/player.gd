extends KinematicBody2D

const ACCELERATION_RATE = 100
const MAX_PLAYER_SPEED = 100
const FRICTION_RATE = 80

func _ready():
	print("Hello godot!")

var velocity = Vector2.ZERO

func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	direction = direction.normalized()

	if direction != Vector2.ZERO :
		velocity = velocity.move_toward(direction * MAX_PLAYER_SPEED, ACCELERATION_RATE * delta)
	else :
		velocity = velocity.move_toward(Vector2.ZERO,FRICTION_RATE * delta)
	print(velocity)
	velocity = move_and_slide(velocity)
