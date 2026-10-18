extends Node
class_name GameController
@export var world2D :Node2D
@export var gui : Control

@export var current_2d_scene : Node2D
var current_2d_scene_name : String
@export var current_gui_scene : Control

@export var first_level : String

var scenes = {}
var player_pos = {}

var inventory

var restart_scene = "res://scenes/test_scene.tscn"

var camera_limits = {}



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.game_controller = self
	current_2d_scene_name = "none"
	inventory = $Inventaire
	
	camera_limits["res://scenes/Levels/Forêt.tscn"] = [-910,-1043,1350,993]
	camera_limits["res://scenes/Levels/Place village.tscn"] = [-100,-5000,5000,5000]
	camera_limits["res://scenes/Levels/maison_forgeron.tscn"] = [-1000,-1000,900,100]
	pass # Replace with function body.


func delete_menu():
	Global.inMenu = false
	current_gui_scene.queue_free()
	var player = load("res://scenes/player.tscn").instantiate()
	get_tree().root.add_child(player)
	inventory = load("res://scenes/inventaire.tscn").instantiate()
	get_tree().root.add_child(inventory)
	
func switch_to_menu():
	Global.inMenu = true
	current_gui_scene = load("res://scenes/menu.tscn").instantiate()
	get_tree().root.add_child(current_gui_scene)
	
	current_2d_scene_name="none"
	for scene in scenes.keys():
		print(scene)
		scenes[scene].queue_free()
		scenes.erase(scene)
	Global.player.queue_free()
	inventory.queue_free()
	
func restart_loop():
	current_2d_scene_name="none"
	for scene in scenes.keys():
		print(scene)
		scenes[scene].queue_free()
		scenes.erase(scene)
	Global.player.queue_free()
	inventory.queue_free()
	var player = load("res://scenes/player.tscn").instantiate()
	get_tree().root.add_child(player)
	inventory = load("res://scenes/inventaire.tscn").instantiate()
	get_tree().root.add_child(inventory)
	change_2d_scene(restart_scene)
	

func change_2d_scene(new_scene : String, delete : bool = false, keep_running : bool = true):
	Global.player.inTransition = true
	if current_2d_scene_name != "none":
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
	
	if(new_scene in camera_limits):
		var limits = camera_limits[new_scene]
		Global.player.camera.limit_left = limits[0]
		Global.player.camera.limit_top = limits[1]
		Global.player.camera.limit_right = limits[2]
		Global.player.camera.limit_bottom = limits[3]
	else:
		Global.player.camera.limit_left = -1000000000
		Global.player.camera.limit_top = -1000000000
		Global.player.camera.limit_right = 1000000000
		Global.player.camera.limit_bottom = 100000000
		
	Global.player.inTransition=false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
