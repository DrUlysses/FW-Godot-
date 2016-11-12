
extends Control

func _ready():
	OS.set_window_position(OS.get_screen_size()*0.5 - OS.get_window_size()*0.5)

func _on_music_finished():
	get_tree().change_scene("res://screens/main_menu.tscn")