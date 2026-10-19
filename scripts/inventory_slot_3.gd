extends Control
@export var objet_is_unlocked = false

func _use_objet():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if(not(Global.inMenu)):
		Global.player.actions_pressed[2] = Input.is_action_pressed("Slot 3")
		
		
	if objet_is_unlocked :
		if Global.player.carreau and Global.player.arbalete :
			$objet_texture.texture = load("res://assets/Objets/arbalète avec carreau.png")
		else:
			if Global.player.carreau:
				$objet_texture.texture = load("res://assets/Objets/carreau d'arbalète.png")
			elif Global.player.arbalete :
				$objet_texture.texture = load("res://assets/Objets/arbalète sans carreau belle.png")

func add_objet():
	objet_is_unlocked = true
	Global.player.object_unlocked[2]=true
