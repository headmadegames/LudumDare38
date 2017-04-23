extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var doorOpen = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_lock_body_enter( body ):
	if !doorOpen :
		print("door._on_lock_body_enter")
		if (body.is_in_group("keyholder")):
			print("opening door")
			print(body)
			get_node("AnimationPlayer").play("open")
			doorOpen = true;
