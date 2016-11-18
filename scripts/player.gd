
extends Area2D

var speed = 5
var hp = 100
var live = true
var damage = 100
var currentBullets = global.level_0Player.bullet
var bullet = load("res://objects/" + currentBullets + ".tscn")


func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
#controls
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
	
	get_node("KinematicBody2D").move(move*speed)
#collision
	if get_node("KinematicBody2D").is_colliding():
		#(приём долбоёбский сейчас, надо исправить его потом)Идёт переход сразу на кинематик бади, поэтому нужно либо переставить скрипт, либо создать новый для этого метода, либо гет парент использовать, если он есть, чтобы добраться до основного нода, где и лежит скрипт
		if get_node("KinematicBody2D").get_collider().get_parent().has_method("damage_taken"):
			get_node("KinematicBody2D").get_collider().get_parent().damage_taken(damage)

	if hp <= 0:
		live = false
	if !live:
		#add partical change for explosive
		get_node("KinematicBody2D/anim").play("death")
		get_tree().set_pause(true)

func _on_timer_timeout():
	if Input.is_action_pressed("shoot"):
		var bulletInstance = bullet.instance()
		var gunPos = get_node("KinematicBody2D/gun").get_global_pos()
		bulletInstance.set_pos(gunPos)
		get_node(".").add_child(bulletInstance)

func damage_taken(delta):
	hp -= delta