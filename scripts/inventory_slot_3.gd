extends Control

@export var objet_is_unlocked = false

func _use_objet():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(not(Global.inMenu)):
		Global.player.actions_pressed[2] = Input.is_action_pressed("Slot 3")

func add_objet():
	objet_is_unlocked = true
	$objet_texture.texture = load("res://assets/Objets/arbalète avec carreau.png")
	Global.player.object_unlocked[1]=true
