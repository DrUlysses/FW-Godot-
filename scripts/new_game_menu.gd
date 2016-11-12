
extends Control

func _on_back_pressed():
	get_tree().change_scene("res://screens/main_menu.tscn")


func _on_play_pressed():
	get_tree().change_scene("res://screens/level_0.tscn")
