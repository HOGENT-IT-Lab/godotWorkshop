extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var leftright = Input.get_axis("ui_left", "ui_right")
	if leftright:
		velocity.x = leftright * SPEED
	else:
		velocity.x = 0
	var updown = Input.get_axis("ui_up", "ui_down")
	if updown:
		velocity.y = updown * SPEED
	else:
		velocity.y = 0
	velocity = SPEED * velocity.normalized()
	var collision_info = move_and_collide(velocity * delta)
