extends Node
class_name GameController
@export var world2D :Node2D
@export var gui : Control

@export var current_2d_scene : Node2D
var current_2d_scene_name : String
var current_gui_scene

var scenes = {}
var player_pos = {}



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.game_controller = self
	current_2d_scene_name = "res://scenes/menu.tscn"
	scenes[current_2d_scene_name] = current_2d_scene
	player_pos[current_2d_scene_name] = Vector2(0,0)
	pass # Replace with function body.

func change_2d_scene(new_scene : String, delete : bool = false, keep_running : bool = true):
	Global.player.inTransition = true
	if delete:
		current_2d_scene.queue_free()
	elif keep_running:
		current_2d_scene.visible = false
		current_2d_scene.process_mode = Node.PROCESS_MODE_DISABLED
		player_pos[current_2d_scene_name] = Global.player.position
	else:
		world2D.remove_child(current_2d_scene)
	if(new_scene in scenes):
		current_2d_scene = scenes[new_scene]
		
		Global.player.position = player_pos[new_scene]
		current_2d_scene_name = new_scene
		scenes[new_scene].visible = true
		await get_tree().create_timer(0.01).timeout
		(func(): scenes[new_scene].process_mode = Node.PROCESS_MODE_INHERIT).call_deferred()
		
	
	else:
		
		var new = load(new_scene).instantiate()
		scenes[new_scene] = new
		world2D.add_child(new)
		current_2d_scene = new
		Global.player.position = Vector2(0,0)
		current_2d_scene_name = new_scene
		
	Global.player.inTransition=false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
