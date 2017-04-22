extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var startRotd

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	startRotd = get_rotd()

func _fixed_process(delta):
	set_rotd(get_parent().get_node("center").get_rotd() + startRotd)