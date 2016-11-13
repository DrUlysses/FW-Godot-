
extends Control
#add loading screen after adding 1mio code blocks
func _on_new_game_pressed():
	get_tree().change_scene("res://screens/new_game_menu.tscn")

func _on_exit_pressed():
	get_tree().quit()

func _on_options_pressed():
	get_tree().change_scene("res://screens/options_menu.tscn")
