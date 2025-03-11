extends Node2D
var scn_instrucciones = load ("res://Scenes/instrucciones.tscn")
var scn_credits = load ("res://Scenes/creditos.tscn")
var scn_juego = load ("res://Scenes/primer_lvl.tscn")

func _on_button_pressed():
	$"/root/Global/boton".play()
	get_tree().change_scene_to_packed(scn_juego)
	print("No hay disponible. Aún no hay un juego.")
	pass # Replace with function body.


func _on_instrucciones_pressed():
	$"/root/Global/boton".play()
	get_tree().change_scene_to_packed(scn_instrucciones)
	pass # Replace with function body.


func _on_créditos_pressed():
	$"/root/Global/boton".play()
	get_tree().change_scene_to_packed(scn_credits)
	pass # Replace with function body.
