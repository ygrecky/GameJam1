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
	dialogue = [["You are welcome, traveler !","Bienvenue chez nous voyageur !"],
	["Unfortunately, it is the  worst time to come visit… A demon has snuck in, the paranoia is consuming us","Malheureusement tu arrives au pire moment… Un démon s’est infiltré parmi nous et la paranoïa nous ronge."],
	["But maybe your arrival among us in this curious attire is a sign from God ","Mais ta venue parmi nous dans ce curieux accoutrement est un signe divin !"],
	["Now I am sure, you are the answer to my prayers !","J’en suis persuadé, tu es la réponse à mes prières !"]]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
