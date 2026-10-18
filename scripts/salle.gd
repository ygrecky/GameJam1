extends Node2D
@export var pnjs: PackedScene


var liste_pnj = []
var liste_pnj_i = []


func leave_salle():
	for pnj_i in liste_pnj_i:
		pnj_i.queuefree()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for pnj in liste_pnj : 
		var pnj_i = pnjs.instantiate()
		pnj_i.position = liste_pnj[pnj][1]
		pnj_i.name = liste_pnj[pnj][0]
		pnj_i.dialogue = liste_pnj[pnj][2]
		pnj.get_node("Sprite2D").texture = load("res://assets/"+pnj_i.name+".png")
		
		liste_pnj_i += pnj_i


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
