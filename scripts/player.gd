
extends Area2D

var speed = 5
var live = true
var bullet = preload("res://objects/bullet_0.tscn")

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var move = Vector2(0, 0)
	if Input.is_action_pressed("ui_up") and get_node("KinematicBody2D").get_global_pos().y > 0:
		move += Vector2(0, -1)
	
	if Input.is_action_pressed("ui_left") and get_node("KinematicBody2D").get_global_pos().x > 0:
		move += Vector2(-1, 0)
		if get_node("KinematicBody2D/anim").get_current_animation() != "left":
			get_node("KinematicBody2D/anim").play("left")
	
	if Input.is_action_pressed("ui_down") and get_node("KinematicBody2D").get_global_pos().y < options.windowSize.height:
		move += Vector2(0, 1)
	
	if Input.is_action_pressed("ui_right") and get_node("KinematicBody2D").get_global_pos().x < options.windowSize.width:
		move += Vector2(1, 0)
		if get_node("KinematicBody2D/anim").get_current_animation() != "right":
			get_node("KinematicBody2D/anim").play("right")
	
	if move == Vector2(0, 0) and get_node("KinematicBody2D/anim").get_current_animation() != "standart":
		get_node("KinematicBody2D/anim").play("standart")
	
	get_node("KinematicBody2D").move(move*speed)

func _on_timer_timeout():
	if Input.is_action_pressed("shoot"):
		var bulletInstance = bullet.instance()
		var gunPos = get_node("KinematicBody2D/gun").get_global_pos()
		#добавить динамичный тип пули
		bulletInstance.set_global_pos(gunPos)
		get_node(".").add_child(bulletInstance)
#func _hit_something():
#	if (killed):
#		return
#	killed = true
#	get_node("anim").play("explode")
#	get_node("../hud/game_over").show()
#	get_node("/root/game_state").game_over()
#	get_parent().stop()
#	set_process(false)
#
#func _on_player_body_enter(body):
#	_hit_something()
#
#func _on_back_to_menu_pressed():
#	get_tree().change_scene("res://main_menu.tscn")
#
#func _on_player_area_enter( area ):
#	if (area.has_method("is_enemy") and area.is_enemy()):
#		_hit_something() 

