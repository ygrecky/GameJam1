extends Pnj


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pnj_name = "Prêtre"
	sprite.texture = load(image_link)
	dialogue = [["Bienvenue chez nous voyageur !"],["Malheureusement tu arrives au pire moment… Un démon s’est infiltré parmi nous et la paranoïa nous ronge."],["Mais ta venue parmi nous dans ce curieux accoutrement est un signe divin !"],["J’en suis persuadé, tu es la réponse à mes prières !"]]
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
