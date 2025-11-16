extends Area2D

@onready var marker: Node2D = $"../../../MetalMarker"

var allomancy_interacion_array: Array[RID] = []
var looking_at_metal: bool = false
var metal_coords: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:

	if body is TileMapLayer:
		# This works becaus TileMapLayer.Physics.Physics Quadrant = 1
		var physics_quadrant_coords  = body.get_coords_for_body_rid(body_rid)

		#body.highlight_cell(cell)
		highlight_cell_marker(body, physics_quadrant_coords)
		print("Tile Detected: ", physics_quadrant_coords)
		looking_at_metal = true
		# TODO add array of shapes with contact
		allomancy_interacion_array.append(body_rid)
		
func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	#body.highlight_cell(cell)
	# TODO remove exited shape from array
	remove_from_array(allomancy_interacion_array, body_rid)	
	# only hide marker if allomancy_interacion_array is empty
	
	if allomancy_interacion_array.is_empty():
		hide_cell_marker(body, )
		looking_at_metal = false
		
		
func highlight_cell_marker(tile:TileMapLayer, quadrant_coords: Vector2i):
	var coords = tile.map_to_local(quadrant_coords)
	metal_coords = coords
	marker.show()
	marker.position = coords
	
func hide_cell_marker(tile:TileMapLayer, ):
	var out_of_view: Vector2i = Vector2i(-0,-0)
	marker.hide()
	marker.position = tile.map_to_local(out_of_view)
	
func remove_from_array(rids_array:Array[RID] , target_rid:RID):
	var index_to_remove = -1
	for i in rids_array.size():
		if rids_array[i] == target_rid: # Assuming elements have a get_rid() method
			index_to_remove = i
			break
	if index_to_remove != -1:
		rids_array.remove_at(index_to_remove)
