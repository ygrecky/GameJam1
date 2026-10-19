extends Pnj

var nom_fichier = "eusebio"

var se_deplace = false

func ending_func() : 
	pass
	

func talk_to():
	var bdd = text_box.instantiate()
	Global.speaker = "eusebio"
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	Global.player.object_unlocked[2] = true
	bdd.ending_func = ending_func


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pnj_name = "Eusebio"
	image_link = "res://assets/Personnages/cerf.png"
	dialogue = [["Bienvenue héros ! Un démon rôde dans le village et menace de le détruire, mais moi, je sais qui c’est ;)"],
	["On raconte que la religion est à l’origine du mal et fédère le culte démoniste."],
	["il faut éradiquer la source de la religion à l’aide d’une arbalète bénite pour libérer le village !!"]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
