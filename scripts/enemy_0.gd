
extends Area2D

var speed = 40
var hp = 100
var live = true
var damage = 25
var dir = rand_range( -3, 3)

func _ready():
	set_fixed_process(true)
	set_pos(Vector2(rand_range(0, global.options.windowSize.width), 0))

func _fixed_process(delta):
	if get_node("KinematicBody2D").get_global_pos().x - get_node("KinematicBody2D/Sprite").get_texture().get_width() <= 0 or get_node("KinematicBody2D").get_global_pos().x + get_node("KinematicBody2D/Sprite").get_texture().get_width() >= global.options.windowSize.width:
		dir = - dir
	if hp <= 0:
		live = false
	if !live:
		get_node(".").queue_free()
	
	get_node("KinematicBody2D").move(Vector2( dir, speed * delta))

	if get_node("KinematicBody2D").get_global_pos().y > global.options.windowSize.height:
		get_node(".").queue_free()
		
	if get_node("KinematicBody2D").is_colliding():
		var collidingBody = get_node("KinematicBody2D").get_collider()
		if collidingBody.has_method("damage_taken"):
			collidingBody.damage_taken(damage)

func damage_taken(delta):
	hp -= delta