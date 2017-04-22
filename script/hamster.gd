extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var canJump = false
#var ballVert =  new Ver

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_process_input(true)

func _fixed_process(delta):
	var jumpDetector = get_node("hamster/jumpDetector")
	if (jumpDetector != null):
		jumpDetector.set_global_rotd(0)
		if (jumpDetector.get_overlapping_bodies().size() > 0):
			canJump = true
		else:
			canJump = false
		if(canJump):
			jumpDetector.get_node("Label").set_text("JUMP")
		else:
			jumpDetector.get_node("Label").set_text("")
	
	if (canJump && Input.is_action_pressed("ui_accept")):
		get_node("hamster").apply_impulse(Vector2(0,0), Vector2(0,-300))
	if (Input.is_action_pressed("ui_right")):
		get_node("hamster").apply_impulse(Vector2(0,0), Vector2(8,-4))
		get_node("hamster").set_angular_velocity(10)
		get_node("center").set_angular_velocity(10)
	if (Input.is_action_pressed("ui_left")):
		get_node("hamster").apply_impulse(Vector2(0,0), Vector2(-8,-4))
		get_node("hamster").set_angular_velocity(-10)
		get_node("center").set_angular_velocity(-10)
