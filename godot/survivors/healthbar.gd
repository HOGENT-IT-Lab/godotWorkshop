extends ColorRect

var health = 100
signal  gameOver

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func health_changed(damage):
	health -= damage
	scale.x = (health/100)
	if health < 0:
		gameOver.emit()

func start_game():
	health = 100
	scale.x = 1
