
extends Area2D

var speed = 40
var dir = rand_range( -3, 3)

func _ready():
	set_fixed_process(true)
	set_pos(Vector2(rand_range(0, options.windowSize.width), 0))

func _fixed_process(delta):
	if get_node("KinematicBody2D").get_global_pos().x - get_node("KinematicBody2D/Sprite").get_texture().get_width() <= 0 or get_node("KinematicBody2D").get_global_pos().x + get_node("KinematicBody2D/Sprite").get_texture().get_width() >= options.windowSize.width:
		dir = - dir
	
	get_node("KinematicBody2D").move(Vector2( dir, speed * delta))

	if get_node("KinematicBody2D").get_global_pos().y > options.windowSize.height:
		get_node(".").queue_free()

