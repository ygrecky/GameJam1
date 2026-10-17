extends CharacterBody2D
class_name Player
@export var speed = 300
@export var long_action_zone: Area2D
@export var short_action_zone : Area2D
@export var collision_ : Area2D

var facing_x = 0
var facing_y = -1
var action_pressed = false
var aimant_activé = false

@export var aimant_acceleration = 0.1
@export var aimant_max_speed = 600
func get_input():
	var direction_x = 0
	var direction_y = 0
	
	if Input.is_action_pressed("action_1"):
		action_pressed = true
	else:
		action_pressed = false
		aimant_activé = false
	
	if Input.is_action_pressed("left"):
		direction_x = -1
		rotation_degrees = 90
		facing_x = -1
		facing_y = 0

		
	if Input.is_action_pressed("right"):
		direction_x = 1
		rotation_degrees = -90
		facing_x = 1
		facing_y = 0

		
	if Input.is_action_pressed("down"):
		direction_y = 1
		rotation_degrees = 0
		facing_x = 0
		facing_y = 1

		
	if Input.is_action_pressed("up"):
		direction_y = -1
		rotation_degrees = 180
		facing_x = 0
		facing_y = -1
	if(not(aimant_activé)):
		velocity = Vector2(direction_x, direction_y) * speed
	
func _process(delta: float) -> void:
	pass
		

func _physics_process(delta):
	
	for elt in short_action_zone.get_overlapping_bodies():
		if(elt is Feu and action_pressed):
			elt.grow(delta, facing_x, facing_y)
	for elt in long_action_zone.get_overlapping_bodies():
		if(elt is BlocMagnetique and action_pressed):
			aimant_activé = true
			velocity = velocity + Vector2(facing_x,facing_y)*aimant_acceleration
	for elt in collision_.get_overlapping_bodies():
		if(elt!=self):
			print(elt)

	get_input()
	move_and_slide()
	
