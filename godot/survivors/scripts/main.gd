extends Node

signal startGame
signal gameOver

# Called when the node enters the scene tree for the first time.
func _ready():
	gameOver.emit()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_game():
	startGame.emit()

func game_over():
	gameOver.emit()
