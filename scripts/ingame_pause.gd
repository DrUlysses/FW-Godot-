
extends Control

func _on_options_pressed():
	get_tree().change_scene("res://screens/options_menu.tscn")

func _on_continue_pressed():
	get_node(".").hide()
	get_tree().set_pause(false)

func _on_exit_pressed():
	get_tree().change_scene("res://screens/main_menu.tscn")
