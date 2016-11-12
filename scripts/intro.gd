
extends Control

func _ready():
	OS.set_window_position(global.options.screenSize*0.5 - global.options.windowSize*0.5)
	OS.set_window_fullscreen(global.options.fullscreen)

func _on_music_finished():
	get_tree().change_scene("res://screens/main_menu.tscn")