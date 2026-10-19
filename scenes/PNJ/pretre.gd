extends Pnj

var nom_fichier = "prêtre"

func talk_to():
	Global.speaker = "prêtre"
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	bdd.ending_func = ending_func

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pnj_name = "Prêtre"
	sprite.texture = load(image_link)
	dialogue = [["Bienvenue chez nous voyageur !"],
	["Malheureusement tu arrives au pire moment… Un démon s’est infiltré parmi nous et la paranoïa nous ronge."],
	["Mais ta venue parmi nous dans ce curieux accoutrement est un signe divin !"],
	["J’en suis persuadé, tu es la réponse à mes prières !"]]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
