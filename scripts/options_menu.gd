
extends Control

#add read options from file

func _ready():
	get_node("fullscreen").set_pressed(global.options.fullscreen)

func _on_fullscreen_toggled( pressed ):
	OS.set_window_fullscreen( pressed )
	get_node("fullscreen").set_pressed( pressed )
	global.options.fullscreen = pressed

func _on_back_pressed():
	get_node(".").hide()
