extends Node2D
var scn_charged = load ("res://Scenes/menu_principal.tscn")


func _on_button_pressed():
	$"/root/Global/AudioStreamPlayer2D".play()
	get_tree().change_scene_to_packed(scn_charged)
	pass # Replace with function body.
