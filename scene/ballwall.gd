extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var startRotd
var voice

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	startRotd = get_rotd()

func _fixed_process(delta):
	get_one_way_collision_direction()
	set_rotd(get_parent().get_node("center").get_rotd() + startRotd)

func _on_wall_body_enter( body ):
	pass
	#print("_on_wall_body_enter " + body.get_name())
	#if("platform".is_subsequence_ofi(body.get_name())):
	#	if(voice == null || !get_node("sounds").is_voice_active(voice)):
	#		voice = get_node("sounds").play("squeak")
