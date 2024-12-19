extends Node2D

@onready
var hero = get_node("Hero")
@onready
var heroStart = hero.transform
@onready
var enemy = get_node("Enemy")
@onready
var enemyStart = enemy.transform

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_game():
	visible = true
	hero.transform = heroStart
	
func game_over():
	visible = false
	enemy.transform = enemyStart
