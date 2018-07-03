extends Node2D

export (NodePath) var tower_path
export (PackedScene) var basic_block
export (PackedScene) var curve_block

onready var tower_node = get_node(tower_path)

var cur_block = "basic_block"

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton:
		# Left click
		if(event.pressed and event.button_index == 1):
			# Spawn a block
			if(get(cur_block) == null or typeof(get(cur_block)) != 17):
				print("Invalid block ", cur_block)
			else:
				print("Adding block ", cur_block)
				var block_instance = get(cur_block).instance()
				block_instance.set_in_editor(true)
				block_instance.global_position = event.global_position
				tower_node.add_child(block_instance)
	elif event is InputEventKey:
		if(event.is_action("out_editor")):
			for n in tower_node.get_children():
				n.set_in_editor(false)