extends Pnj


var nom_fichier = "paysan"

var se_deplace = false

func ending_func() : 
	pass
	

func talk_to():
	Global.speaker = "paysan"
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
	pnj_name = "Paysan"
	dialogue = [
	["Hello, you must be the stranger from all this rumors","Bonjour, vous devez être l'étranger dont tout le monde parle ici !"],
	["I hope that our daugther is not bothering you too much. She just loves to play hide-and-seek, sometimes it takes us many hours to find her.","J'espère que notre fille ne vous pose pas trop de soucis, elle adore jouer à cache cache et nous mettons parfois plusieurs heures à la retrouver..."],
	["She also loves to steal the old technologies from the villagers. I heard some grumblings from the blacksmith from the window...","Elle adore voler les technologies anciennes des villageois, j'ai entendu le forgeron grogner à travers sa fenêtre..."],
	["Also it seems that the antic compass is broken : since the demon is here, it points to the church. That is so weird ","A ce propos, on dirait que notre antique bousole est cassée : L'aiguille pointe depuis quelques jours uniquement vers l'église, c'est très étrange..."]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
