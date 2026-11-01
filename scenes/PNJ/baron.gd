extends Pnj


var nom_fichier = "baron"

var se_deplace = false

func ending_func() : 
	Global.game_controller.inventory.get_child(0).s3.add_objet()
	Global.player.object_unlocked[2] = true
	Global.player.arbalete = true
	

func talk_to():
	Global.speaker = "baron"
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
	pnj_name = "Baron"
	dialogue = [["Let's talk about the meaningfull things… Hunt!!!","Parlons des choses vraiment importantes… la chasse!!!"],
	["Is this marvelous sport practiced in your country?","Est ce que cette merveille est pratiquée dans tes contrées Voyageur ?"],
	["Ahhh, what a pleasure it is to know we share this passion","Ah mais quel plaisir de savoir que nous partageons une telle passion."],
	["As a token of our friendship,take that. My crossbow","Comme gage de mon amitié permet moi de t’offrir mon arbalète."],
	["If on your way you find a prey worthy of this treasure, don't think twice and shoot! This is the mark of a great hunter","Si jamais tu trouves une proie digne de ce bijou n’hésite pas et tire, le plus tôt sera le mieux."],
	["I am deeply sorry, but I have no more bolts","A mon grand désespoir, je n’ai plus de carreaux."],
	["Maybe you'll find some to our (bad) blacksmith, if he feels less condescending than usual","Mais tu pourras peut-être en récupérer chez notre (mauvais) forgeron s’il daigne ne pas être méprisant comme à son habitude."]
	]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
