extends Control

@export var objet_is_unlocked = false
var base_position
func _use_objet():
	pass
	
func _ready():
	base_position = $objet_texture.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(not(Global.inMenu)):
		if Input.is_action_just_pressed("Slot 2"):
			add_objet()
			if objet_is_unlocked:
				_use_objet()
		Global.player.actions_pressed[1] = Input.is_action_pressed("Slot 2")

func add_objet():
	objet_is_unlocked = true
	$objet_texture.texture = load("res://assets/Objets/aimant.png")
	$objet_texture.scale = Vector2(2,2)
	$objet_texture.position = base_position- Vector2(25,25)
