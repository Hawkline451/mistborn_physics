extends CharacterBody2D

@export var SPEED = 300

var dir: float
var spawnPosition : Vector2
var spawnRotation : float
var player: CharacterBody2D

func _ready():
	global_position = spawnPosition
	global_rotation = spawnRotation
	player = get_parent().get_node("Player")
	
	
func _physics_process(delta: float):
	velocity = Vector2(SPEED, 0).rotated(dir)
	move_and_slide()
	
func _on_area_2d_body_entered(body):
	print(body, "bbb")
	if body is TileMapLayer:
		print("HIT")
		queue_free()
		player.set_is_ready()
		
		
func _on_life_timeout():
	queue_free()
	player.set_is_ready()
