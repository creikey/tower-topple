extends RigidBody2D

var in_editor = false

func set_in_editor(val):
	if(val == true):
		mode = RigidBody2D.MODE_KINEMATIC
	else:
		mode = RigidBody2D.MODE_RIGID
		linear_velocity = Vector2(0.1,0.1)
	in_editor = val