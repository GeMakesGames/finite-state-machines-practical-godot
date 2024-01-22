extends Node
class_name FiniteStateMachine

var states = {}
var current_state
var current_state_name

func _ready():
	for node in get_children():
		if node is State:
			states[node.name] = node
			node.object = get_parent()
			node.finite_state_machine = self
		
func change_state(next_state_name):
	if current_state:
		current_state.exit()
	current_state = states[next_state_name]
	current_state_name = next_state_name
	current_state.enter()

func physics_process(delta):
	if not current_state: return
	current_state.physics_process(delta)

func process(delta):
	if not current_state: return
	current_state.process(delta)
