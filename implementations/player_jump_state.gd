extends State

@onready var timer = $Timer

func enter():
	object.animation_player.play("jump")
	object.jump.emit()
	timer.start()

func physics_process(_delta):
	if timer.is_stopped():
		change_state("Fall")
