
extends Area2D

var speed = 300
var hp = 1
var live = true
var damage = 100
#добавить определение sender'а
func _fixed_process(delta):
	get_node("KinematicBody2D").move(Vector2(0, -speed * delta))
	if get_node("KinematicBody2D").get_global_pos().y < 0:
		get_node(".").queue_free()
	
	if hp <= 0:
		live = false
	if !live:
	#add explosive anim
		get_node(".").queue_free()
	
	if get_node("KinematicBody2D").is_colliding():
		if get_node("KinematicBody2D").get_collider().get_parent().has_method("damage_taken"):
			get_node("KinematicBody2D").get_collider().get_parent().damage_taken(damage)


func _ready():
	set_fixed_process(true)

func damage_taken(delta):
	hp -= delta