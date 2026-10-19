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
	["Bonjour, vous devez être l'étranger dont tout le monde parle ici !"],
	["J'espère que notre fille ne vous pose pas trop de soucis, elle adore jouer à cache cache et nous mettons parfois plusieurs heures à la retrouver..."],
	["Elle adore voler les technologies anciennes des villageois, j'ai entendu le forgeron grogner à travers sa fenêtre.."],
	["A ce propos, on dirait que notre antique bousole est cassée : L'aiguille pointe depuis quelques jours uniquement vers l'église, c'est très étrange..."]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
