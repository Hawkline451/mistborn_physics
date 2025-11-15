extends TileMapLayer
@onready var marker: Node2D = get_parent().get_node("MetalMarker") # Child Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_local_mouse_position()
	var cell_pos = local_to_map(mouse_pos)
	# Check if a tile exists at the calculated cell coordinates
	var tile_data = get_cell_tile_data(cell_pos)

	if tile_data:
		print(cell_pos, "mouse collision")
		highlight_cell_marker(cell_pos)
		# You can access tile_data properties here, e.g., tile_data.get_custom_data("Name")
	else:
		#hide_cell_marker()
		pass

func highlight_cell_marker(cell_position: Vector2i):
	marker.show()
	marker.position = map_to_local(cell_position)
	
func hide_cell_marker():
	var out_of_view: Vector2i = Vector2i(-0,-0)
	marker.hide()
	marker.position = map_to_local(out_of_view)
