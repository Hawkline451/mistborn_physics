extends CharacterBody2D

@onready var game = get_tree().get_root().get_node("Game")
@onready var bullet = load("res://scenes/bullet.tscn")

var is_ready: = true

func set_is_ready():
	is_ready = true

func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("shoot") and is_ready:
		is_ready = false
		# This code will run as long as the "interact" key is held down.
		print("Interact key is pressed!")
		shoot()

func shoot():
	var instance = bullet.instantiate()
	instance.dir = rotation
	instance.spawnPosition = global_position + Vector2(5,0)
	instance.spawnRotation = rotation
	
	game.add_child.call_deferred(instance)
	
	#var bullet_life = instance.get_node("Life")
	#bullet_life.start()
	#print("yay", bullet_life)
	
	
