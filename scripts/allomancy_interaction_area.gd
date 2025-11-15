extends Area2D

@onready var marker: Node2D = $"../../../MetalMarker"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:

	if body is TileMapLayer:
		# This works becaus TileMapLayer.Physics.Physics Quadrant = 1
		var physics_quadrant_coords  = body.get_coords_for_body_rid(body_rid)

		#body.highlight_cell(cell)
		highlight_cell_marker(body, physics_quadrant_coords)
		print("Tile Detected: ", physics_quadrant_coords) 
		
func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	#body.highlight_cell(cell)
	hide_cell_marker(body, )
		
func highlight_cell_marker(tile:TileMapLayer, cell_position: Vector2i):
	marker.show()
	marker.position = tile.map_to_local(cell_position)
	
func hide_cell_marker(tile:TileMapLayer, ):
	var out_of_view: Vector2i = Vector2i(-0,-0)
	marker.hide()
	marker.position = tile.map_to_local(out_of_view)
