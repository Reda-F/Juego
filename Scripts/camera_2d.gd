extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var position_player = get_parent().get_node("player").global_position.x
	var position_camera = get_offset().x
	if position_player > 300 and position_player < 2335 - 780:
		offset.x = position_player - 300
	
