extends CharacterBody2D

@export var speed = 300
@export var action_zone: Area2D
var facing_x = 0
var facing_y = -1
var action_pressed = false
func get_input():
	action_zone.hide()
	var direction_x = 0
	var direction_y = 0

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
		
	velocity = Vector2(direction_x, direction_y) * speed
	action_zone.show()
	
func _process(delta: float) -> void:
	pass
		

func _physics_process(delta):
	
	for elt in action_zone.get_overlapping_bodies():
		if(elt is Feu):
			elt.grow(delta, facing_x, facing_y)
	get_input()
	move_and_slide()
