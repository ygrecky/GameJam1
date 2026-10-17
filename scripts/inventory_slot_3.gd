extends Control

@export var objet_is_unlocked = false

func _use_objet():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("Slot 3"):
		add_objet()
		if objet_is_unlocked:
			_use_objet()
	Global.player.actions_pressed[2] = Input.is_action_pressed("Slot 3")

func add_objet():
	objet_is_unlocked = true
	$objet_texture.texture = load("res://assets/Objets/arbalète avec carreau.png")
