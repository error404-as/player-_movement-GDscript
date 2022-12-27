extends KinematicBody2D


var motion = Vector2()
var speed = 40
var gravity = 10
var dir = -1


func _process(delta):
	motion = move_and_slide(motion,Vector2.UP)
	pass

func _physics_process(delta):
	motion.y += gravity
	motion.x = speed * dir
	if is_on_wall():
		dir = dir * -1	


func _on_hitbox_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
	pass
