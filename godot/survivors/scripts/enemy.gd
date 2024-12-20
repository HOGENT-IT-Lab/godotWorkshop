extends CharacterBody2D

const SPEED = 50.0
const DPS = 75.0

signal dealDamage(amount)

@onready
var hero = get_node('../Hero')

func _ready():
	print(position)

func _physics_process(delta):
	look_at(hero.transform.origin)
	velocity = hero.transform.origin - transform.origin
	velocity = velocity.normalized()
	velocity *= SPEED

	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		if collision_info.get_collider() == hero:
			dealDamage.emit(delta * DPS)
		else:
			queue_free()
