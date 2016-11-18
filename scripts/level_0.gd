
extends Node2D

func _ready():
	set_process(true)
	get_node("player/KinematicBody2D").set_pos(Vector2(global.options.windowSize.width*0.5, global.options.windowSize.height*0.9))

func _process(delta):
	if !get_node("player").live:
		#change position of this scene on the screen
		get_node("player_died").set_global_pos(Vector2(0, global.options.windowSize.height*0.5))
		get_node("player_died").show()

	if Input.is_action_pressed("ui_cancel"):
		get_tree().set_pause(true)
		get_node("ingame_pause").show()

func _on_enemy_spawn_timeout():
	var enemy = preload("res://objects/enemy_0.tscn").instance()
	get_node(".").add_child(enemy)
