
extends Area2D

var speed = 5
var hp = 100
var live = true
var damage = 100
var bullet = preload("res://objects/bullet_0.tscn")


func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
#movement
	var move = Vector2(0, 0)
	if Input.is_action_pressed("ui_up") and get_node("KinematicBody2D").get_global_pos().y > 0:
		move += Vector2(0, -1)
	
	if Input.is_action_pressed("ui_left") and get_node("KinematicBody2D").get_global_pos().x > 0:
		move += Vector2(-1, 0)
		if get_node("KinematicBody2D/anim").get_current_animation() != "left":
			get_node("KinematicBody2D/anim").play("left")
	
	if Input.is_action_pressed("ui_down") and get_node("KinematicBody2D").get_global_pos().y < global.options.windowSize.height:
		move += Vector2(0, 1)
	
	if Input.is_action_pressed("ui_right") and get_node("KinematicBody2D").get_global_pos().x < global.options.windowSize.width:
		move += Vector2(1, 0)
		if get_node("KinematicBody2D/anim").get_current_animation() != "right":
			get_node("KinematicBody2D/anim").play("right")
	
	if move == Vector2(0, 0) and get_node("KinematicBody2D/anim").get_current_animation() != "standart":
		get_node("KinematicBody2D/anim").play("standart")
	#add anim and partical change for explosive
	get_node("KinematicBody2D").move(move*speed)
#collision
	if get_node("KinematicBody2D").is_colliding():
		print(get_node("KinematicBody2D").get_collider().has_method("damage_taken"))
		#Идёт переход сразу на кинематик бади, поэтому нужно либо переставить скрипт, либо создать новый для этого метода, либо гет парент использовать, если он есть, чтобы добраться до основного нода, где и лежит скрипт
		#print(get_node("KinematicBody2D").get_collider().has_method("damage"))
#	if get_node("KinematicBody2D").get_collider().has_method("damage_taken"):
#			print("get")
#			get_node("KinematicBody2D").get_collider().damage_taken(damage)

	if hp <= 0:
		live = false
	#if !live:
	#	get_node(".").queue_free()

func _on_timer_timeout():
	if Input.is_action_pressed("shoot"):
		var bulletInstance = bullet.instance()
		var gunPos = get_node("KinematicBody2D/gun").get_global_pos()
		#добавить динамичный тип пули
		bulletInstance.set_pos(gunPos)
		get_node(".").add_child(bulletInstance)
#	if (killed):
#		return
#	killed = true
#	get_node("anim").play("explode")
#	get_node("../hud/game_over").show()
#	get_node("/root/game_state").game_over()
#	get_parent().stop()
#	set_process(false)
#func _on_back_to_menu_pressed():
#	get_tree().change_scene("res://main_menu.tscn")

func damage_taken(delta):
	hp -= delta