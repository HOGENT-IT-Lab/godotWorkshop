extends StaticBody2D

var BASE_ROT_SPEED = 4
var enabled = false
var active = false
var level = 1
@onready
var timer:Timer = get_node("Timer")
@onready
var collider:CollisionPolygon2D = get_node("CollisionPolygon2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	collider.disabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enabled:
		rotate(BASE_ROT_SPEED * level * delta)
	pass

func enable():
	enabled = true
	timer.start(0.6)
	switch_active()

func levelup():
	level += 1

func switch_active():
	visible = !visible
	collider.disabled = !visible
