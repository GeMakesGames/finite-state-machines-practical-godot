extends Node2D

signal idle
signal run
signal fall
signal jump

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var jump_timer = $JumpTimer
@onready var fall_timer = $FallTimer

var grounded = true
var falling = false

func _ready():
	animation_player.play("idle")
	idle.emit()

func _physics_process(_delta):
	var input_x = Input.get_axis("ui_left", "ui_right")
	if input_x != 0:
		sprite.flip_h = input_x == -1
		
	if not grounded and jump_timer.is_stopped():
		if not falling:
			animation_player.play("fall")
			fall_timer.start()
			falling = true
			fall.emit()
			return
		else:
			if fall_timer.is_stopped():
				falling = false
				grounded = true
					
	if grounded and Input.is_action_just_pressed("ui_accept"):
		animation_player.play("jump")
		jump_timer.start()
		grounded = false
		jump.emit()
	elif grounded and input_x != 0:
		animation_player.play("run")
		run.emit()
	elif grounded and input_x == 0:
		animation_player.play("idle")
		idle.emit()
