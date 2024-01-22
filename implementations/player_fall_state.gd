extends State

@onready var timer = $Timer

func enter():
	object.animation_player.play("fall")
	object.fall.emit()
	timer.start()

func physics_process(_delta):
	if not timer.is_stopped():
		return
		
	if object.get_input_x():
		change_state("Idle")
	else:
		change_state("Run")
