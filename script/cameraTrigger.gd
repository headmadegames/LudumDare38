extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_cameraTrigger_body_enter( body ):
	if (body.is_in_group("player")):
		#body.get_node("camera").set_zoom(Vector2(2,2))
		body.get_node("camera/AnimationPlayer").play("zoomOut")
		


func _on_cameraTrigger_body_exit( body ):
	if (body.is_in_group("player")):
		#body.get_node("camera/AnimationPlayer").set_zoom(Vector2(1,1))
		body.get_node("camera/AnimationPlayer").play("zoomIn")
