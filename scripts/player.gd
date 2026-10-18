extends CharacterBody2D
class_name Player
@export var speed = 300
@export var long_action_zone: Area2D
@export var short_action_zone : Area2D
@export var collision_ : Area2D
@export var collision_shape2d : CollisionShape2D
@export var sprite : Sprite2D

var facing_x = 0
var facing_y = -1
var action_pressed = false
var action_just_pressed = false
var aimant_activé = false
@export var fleche_delay: float
var fleche_ready = true

var inTransition = false

var isTalking = false

var object_unlocked = [true,true,true,false,false,false]
var actions_pressed = [false,false,false,false,false,false]
var soufleur_index = 0
var aimant_index = 1
var arbalette_index = 2

@export var aimant_acceleration = 0.1
@export var aimant_max_speed = 600

func _ready():
	Global.player = self
	$Node2D/interaction_label.visible = false

func get_input(delta):
	aimant_activé = actions_pressed[aimant_index]
	var direction_x = 0
	var direction_y = 0
	action_just_pressed = Input.is_action_just_pressed("action_1")
	if Input.is_action_pressed("action_1"):
		action_pressed = true
	else:
		action_pressed = false
	
	
		
	
	if Input.is_action_pressed("left"):
		direction_x = -1
		rotation_degrees = 90
		$Node2D.rotation_degrees = -90
		facing_x = -1
		facing_y = 0
	

		
	if Input.is_action_pressed("right"):
		direction_x = 1
		rotation_degrees = -90
		$Node2D.rotation_degrees = 90
		facing_x = 1
		facing_y = 0

		
	if Input.is_action_pressed("down"):
		direction_y = 1
		rotation_degrees = 0
		$Node2D.rotation_degrees = 0
		facing_x = 0
		facing_y = 1

		
	if Input.is_action_pressed("up"):
		direction_y = -1
		rotation_degrees = 180
		$Node2D.rotation_degrees = 180
		facing_x = 0
		facing_y = -1
		
	if Input.is_action_just_pressed("debug1"):
		Global.player.inTransition = true
		Global.game_controller.change_2d_scene("res://scenes/test_scene.tscn",false,true)
		
	if Input.is_action_just_pressed("debug2"):
		Global.player.inTransition = true
		Global.game_controller.change_2d_scene("res://scenes/game.tscn",false,true)
	if(not(aimant_activé)):
		velocity = Vector2(direction_x, direction_y) * speed*delta*60
	
func _process(delta: float) -> void:
	pass
		

func _physics_process(delta):
	var isPaused = isTalking
	if(not isPaused):
		for elt in short_action_zone.get_overlapping_bodies():
			if(elt is Pnj and action_just_pressed):
				isTalking = true
				elt.talk_to()
		for elt in collision_.get_overlapping_bodies():
			if(elt!=self):
				print(elt)
		for elt in collision_.get_overlapping_areas():
			if(elt.get_parent() is TpZone and action_just_pressed):
				Global.game_controller.change_2d_scene(elt.get_parent().destination_path,false,true)
			

		get_input(delta)
		for i in range(6):
			if(actions_pressed[i] and object_unlocked[i]):
				use_object(i,delta)
				
		move_and_slide()

func use_object(index,delta):
	if(true):
		if(index == soufleur_index):
			for elt in short_action_zone.get_overlapping_bodies():
				if(elt is Feu):
					elt.grow(delta, facing_x, facing_y)
		
	if(index == aimant_index and actions_pressed):
		for elt in long_action_zone.get_overlapping_bodies():
			if(elt is BlocMagnetique):
				aimant_activé = true
				velocity = velocity + Vector2(facing_x,facing_y)*aimant_acceleration
	
	if(index==arbalette_index):
		if(fleche_ready):
			var fleche = load("res://scenes/flèche.tscn").instantiate()
			fleche_ready = false
			fleche.position = position + facing_x*sprite.get_rect().size.x*Vector2(1,0) + facing_y*sprite.get_rect().size.y*Vector2(0,1)
			fleche.direction_x =facing_x
			fleche.direction_y = facing_y
			get_parent().add_child(fleche)
			await get_tree().create_timer(fleche_delay).timeout
			(func(): fleche_ready = true).call_deferred()
		




func _on_short_action_zone_body_entered(body: Node2D) -> void:
	if body is Pnj:
		$Node2D/interaction_label.visible = true
		#$Node2D/interaction_label/Label.visible = true


func _on_short_action_zone_body_exited(body: Node2D) -> void:
	if body is Pnj:
		$Node2D/interaction_label.visible = false
		#$Node2D/interaction_label/Label.visible = false
