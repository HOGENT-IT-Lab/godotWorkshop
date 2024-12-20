extends Node2D

const STARTING_WEAPON = "Sword"
@onready
var hero = get_node("Hero")
@onready
var timer = get_node("Timer")
@onready
var heroStart = hero.transform

signal heroDamaged(amount)

@export var enemyScene : PackedScene

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
	timer.start(0.2)
	spawn()
	spawn()
	spawn()
	
func game_over():
	visible = false
	timer.stop()

func spawn():
	var enemy = enemyScene.instantiate()
	var border = randi_range(0,3)
	var x = 0
	var y = 0
	if border == 0:
		x = randi_range(0,get_viewport().size.x)
		y = -30
	elif border == 1:
		x = get_viewport().size.x + 30
		y = randi_range(0,get_viewport().size.y)
	elif border == 2:
		x = randi_range(0,get_viewport().size.x)
		y = get_viewport().size.y + 30
	else:
		x = -30
		y = randi_range(0,get_viewport().size.y)
	enemy.position = Vector2(x,y)
	enemy.dealDamage.connect(hero_damaged)
	add_child(enemy)
	print("ok")

func hero_damaged(amount):
	heroDamaged.emit(amount)
