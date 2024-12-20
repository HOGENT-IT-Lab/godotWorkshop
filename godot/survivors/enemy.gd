extends CharacterBody2D

const SPEED = 50.0
const DPS = 75.0
signal dealDamage(amount)
var primary = true

@onready
var hero = get_node('../Hero')
@onready
var collider = get_node("CollisionShape2D")



func _ready():
	visible = false
	collider.disabled = true

func _physics_process(delta):
	velocity = hero.transform.origin - transform.origin
	velocity = velocity.normalized()
	velocity *= SPEED

	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		if collision_info.get_collider() == hero:
			dealDamage.emit(delta * DPS)
		else:
			queue_free()

func enable():
	visible = true
	collider.disabled = false
