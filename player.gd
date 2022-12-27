extends KinematicBody2D

var motion = Vector2()
export var speed = 125
export var gravity = 10
export var jump = -200
var double_jump = true

func _process(delta):
	motion = move_and_slide(motion,Vector2.UP)
	pass
	
func _physics_process(delta):
	motion.y += gravity             
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		if is_on_floor():
			$AnimationPlayer.play("move")
		$Sprite.flip_h = true	
	elif Input.is_action_pressed("ui_left"):	
		motion.x = -speed
		if is_on_floor():
			$AnimationPlayer.play("move")
		$Sprite.flip_h = false	
	else :
		motion.x = 0
		if is_on_floor():
			$AnimationPlayer.play("idel")
	if !is_on_floor():
		$AnimationPlayer.play("idel")	
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = jump
			double_jump = true
	if !is_on_floor() && motion.y > 0 && double_jump == true &&  Input.is_action_just_pressed("ui_up") :
		motion.y = jump	
		double_jump = false
		
	Void()	
		
	pass
	


func _on_hitbox_body_entered(body):
	if body.is_in_group("enemy"):
		get_tree().reload_current_scene()
	pass
	

func Void():
	if global_position.y >= 200 :
		get_tree().reload_current_scene()
	pass
