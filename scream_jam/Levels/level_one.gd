extends Node2D


func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	get_clicked_tile_power()


func get_clicked_tile_power():
	var clicked_cell = $TileMap.local_to_map($TileMap.get_local_mouse_position())
	var data = $TileMap.get_cell_tile_data(0, clicked_cell)
	if data:
		return data.get_custom_data("power")
	else:
		return 0
