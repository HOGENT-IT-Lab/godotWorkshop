extends CharacterBody2D

const SPEED = 50.0
const DPS = 75.0
signal dealDamage(amount)

@onready
var hero = get_node('../Hero')

func _physics_process(delta):
	velocity = hero.transform.origin - transform.origin
	velocity = velocity.normalized()
	velocity *= SPEED

	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		dealDamage.emit(delta * DPS)
