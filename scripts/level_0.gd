
extends Node2D


func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	pass
	#add pause
#	if Input.action_press("ui_cancel"):
#		get_tree().set_pause(true)

func _on_enemy_spawn_timeout():
	var enemy = preload("res://objects/enemy_0.tscn").instance()
	get_node(".").add_child(enemy)
