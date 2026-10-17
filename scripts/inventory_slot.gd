extends Control

@export var objet_is_unlocked = [false, false]

#var objet_1_image = preload("res://assets/Objets/arbalète.jpg").get_image()

func _use_objet(n: int):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("Slot 1"):
		if objet_is_unlocked[0]:
			_use_objet(1)
	if Input.is_action_pressed("Slot 2"):
		if objet_is_unlocked[1]:
			_use_objet(2)

func add_objet(n: int):
	objet_is_unlocked[n-1] = true
	if n == 1:
		$objet_texture.texture("res://assets/Objets/arbalète.jpg")
	elif n == 2:
		$objet_texture.texture("res://assets/Objets/arbalète.jpg")
