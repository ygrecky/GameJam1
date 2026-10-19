extends Pnj

var nom_fichier = "bibliothécaire secte"

var se_deplace = false

func ending_func() : 
	pass
	

func talk_to():
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	Global.player.object_unlocked[2] = true
	bdd.ending_func = ending_func


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pnj_name = "Bibliothécaire "
	dialogue = [["J'ai lu dans mes livres que nous avons chacun un sceau qui nous est propre"],
	["Un seau que seul toi peut voir, Héros, lorsque tu parles avec nous"],
	["Cependant, le démon as un sceau corrompu, qu'il nous est donc impossible de remarquer"],
	["Le livre que nous te donnons te permet de déchiffrer les sceaux et de trouver le démon"],
	["Nous comptons sur toi, Héros."]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
