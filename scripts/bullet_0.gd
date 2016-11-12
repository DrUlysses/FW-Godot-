
extends Area2D

var speed = 300
#добавить определение sender'а
func _process(delta):
	get_node("physik").move(Vector2(0, -speed * delta))
	if get_node("physik").get_global_pos().y < 0:
		get_node(".").queue_free()

func _ready():
	set_process(true)

func _on_bullet_0_body_enter( body ):
	set_process(false)
