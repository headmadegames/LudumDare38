extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var canJump = false
var jumpVoice
var squeakVoice
#var ballVert =  new Ver

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_process_input(true)

func _fixed_process(delta):
	
	var raycast = get_node("raycast")
	var shadowpos = raycast.get_collision_point()
	var shadowangle = raycast.get_collision_normal().angle()
	var shadow = get_node("shadow")
	var hamsterPos = get_node("hamster").get_global_pos()
	shadow.set_global_pos(shadowpos)
	shadow.set_global_rot(shadowangle)
	raycast.set_global_pos(hamsterPos)
	if(abs(hamsterPos.x - shadowpos.x) > 20):
		shadow.set_opacity(0)
	else:
		shadow.set_opacity(0.3)
	
	
	var jumpDetector = get_node("hamster/jumpDetector")
	if (jumpDetector != null):
		jumpDetector.set_global_rotd(0)
		if (jumpDetector.get_overlapping_bodies().size() > 0 && (jumpVoice == null || !get_node("hamster/sounds").is_voice_active(jumpVoice))):
				canJump = true
		else:
			canJump = false
		if(canJump):
			jumpDetector.get_node("Label").set_text("JUMP")
		else:
			jumpDetector.get_node("Label").set_text("")
	
	if (canJump && Input.is_action_pressed("ui_accept")):
		get_node("hamster").apply_impulse(Vector2(0,0), Vector2(0,-1000))
		jumpVoice = get_node("hamster/sounds").play("jump", -2)
		
	if (Input.is_action_pressed("ui_right")):
		get_node("hamster").apply_impulse(Vector2(0,0), Vector2(18,-4))
		get_node("hamster").set_angular_velocity(10)
		get_node("center").set_angular_velocity(10)
	if (Input.is_action_pressed("ui_left")):
		get_node("hamster").apply_impulse(Vector2(0,0), Vector2(-18,-4))
		get_node("hamster").set_angular_velocity(-10)
		get_node("center").set_angular_velocity(-10)


func _on_jumpDetector_body_enter( body ):
	var sounds = get_node("hamster/sounds")
	if (body.is_in_group("deadly")):
		squeakVoice = sounds.play("ouch")
		get_node("hamster").apply_impulse(Vector2(0,0), Vector2(-1000,-300))
		get_node("center").apply_impulse(Vector2(0,0), Vector2(-1000,-300))
	else:
		var volume = -3000/get_node("hamster").get_linear_velocity().length()
		if(squeakVoice == null || !sounds.is_voice_active(squeakVoice)):
			print("_on_wall_body_enter")
			print(volume)
			squeakVoice = sounds.play("squeak")
			sounds.voice_set_volume_scale_db(squeakVoice, volume)
