
extends Control

#add read options from file

func _ready():
	get_node("fullscreen").set_pressed(options.fullscreen)

func _on_fullscreen_toggled( pressed ):
	OS.set_window_fullscreen( pressed )
	get_node("fullscreen").set_pressed( pressed )
	options.fullscreen = pressed

func _on_back_pressed():
	get_tree().change_scene("res://screens/main_menu.tscn")
