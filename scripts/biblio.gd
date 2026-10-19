extends StaticBody2D
class_name  Biblio
@export var texte: Array[String]
var dialogue = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for elt in texte:
		dialogue.append([elt])
	pass # Replace with function body.

func read():
	var bdd = load("res://scenes/boite_texte.tscn").instantiate()
	bdd.dialogue = dialogue
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
