
extends Control

func _ready():
	OS.set_window_position(options.screenSize*0.5 - options.windowSize*0.5)

func _on_music_finished():
	get_tree().change_scene("res://screens/main_menu.tscn")