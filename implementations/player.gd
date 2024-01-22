extends Node2D

signal idle
signal run
signal fall
signal jump

@onready var finite_state_machine = $FiniteStateMachine
@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D

func _ready():
	finite_state_machine.change_state("Idle")

func get_input_x():
	return Input.get_axis("ui_left", "ui_right")

func _physics_process(delta):
	var input_x = get_input_x()
	if input_x != 0:
		sprite.flip_h = input_x == -1
	finite_state_machine.physics_process(delta)
