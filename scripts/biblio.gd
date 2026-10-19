extends StaticBody2D
class_name  Biblio
@export var texte: Array[String]
@export var donner_livre = false
var dialogue = []

func ending_func():
	Global.game_controller.inventory.get_child(0).s5.add_objet()
	Global.player.object_unlocked[4] = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for elt in texte:
		dialogue.append([elt])
	pass # Replace with function body.

func read():
	var bdd = load("res://scenes/boite_texte.tscn").instantiate()
	bdd.dialogue = dialogue
	if(donner_livre):
		bdd.ending_func = ending_func
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
