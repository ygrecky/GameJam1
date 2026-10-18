extends Node2D
class_name Papier
@export var area : Area2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	for elt in area.get_overlapping_bodies():
		if(elt is Player and elt.action_just_pressed):
			print("Lecture de la feuille")
			if not Global.lettre_grimoire:
				Global.lettre_grimoire = true
	pass
