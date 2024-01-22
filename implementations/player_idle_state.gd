extends State

func enter():
	object.animation_player.play("idle")
	object.idle.emit()

func physics_process(_delta):
	var input_x = object.get_input_x()
	if Input.is_action_just_pressed("ui_accept"):
		change_state("Jump")
	elif input_x != 0:
		change_state("Run")
