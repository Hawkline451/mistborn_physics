extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

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
	
	
	
