extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_Area2D_body_enter( body ):
	print("key._on_Area2D_body_enter")
	print(body.get_name())
	if (body.is_in_group("player")):
		print("key picked up")
		print(body.get_name())
		print(body.get_filename())
		body.add_to_group("keyholder")
		body.get_parent().get_node("sounds").play("pickup")
		queue_free()
