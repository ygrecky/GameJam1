extends Pnj

var nom_fichier = "souris"

var se_deplace = false
var boucle = false

func new_dialogue():
	dialogue = [["Viens me revoir dès que tu veux rejouer à cache cache, hihihi!"]]
	
func ending_func() : 
	if boucle == false : 
		Global.game_controller.inventory.get_child(0).s1.add_objet()
		boucle = true
		new_dialogue()
	



func talk_to():
	Global.speaker = "souris"
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	bdd.ending_func = ending_func


# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	disparait()
	pnj_name = "Petite fille"
	dialogue = [["Bravo tu m'as attrapée à nouveau hihi !"],
	["Voici mon trésor !"]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
	
