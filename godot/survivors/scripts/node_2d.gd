extends Node2D

const STARTING_WEAPON = "Sword"
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
	var weapon = get_node("Hero/" + STARTING_WEAPON)
	weapon.enable()
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
