extends Camera2D


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var position_player = get_parent().get_node("player").global_position.x
	if position_player > 300 and position_player < 2320 - 780:
		offset.x = position_player - 300
