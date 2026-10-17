extends CharacterBody2D

@export var speed = 300
@export var action_zone: Area2D

func get_input():
	var direction_x = 0
	var direction_y = 0

	if Input.is_action_pressed("left"):
		direction_x = -1
		rotation_degrees = 90
	if Input.is_action_pressed("right"):
		direction_x = 1
		rotation_degrees = -90
	if Input.is_action_pressed("down"):
		direction_y = 1
		rotation_degrees = 0
	if Input.is_action_pressed("up"):
		direction_y = -1
		rotation_degrees = 180
	velocity = Vector2(direction_x, direction_y) * speed
	
func _process(delta: float) -> void:
	for elt in action_zone.get_overlapping_bodies():
		if(elt is Feu):
			elt.grow(delta, rotation)
		

func _physics_process(delta):
	get_input()
	move_and_slide()
