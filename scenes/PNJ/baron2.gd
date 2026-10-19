extends Pnj

var nom_fichier = "baronne secte"

var se_deplace = false

func ending_func() : 
	pass
	

func talk_to():
	var bdd = text_box.instantiate()
	Global.speaker = "baron"
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
	image_link = "res://assets/Personnages/cerf.png"
	dialogue = [["Oyez oyez brave héros ! Nous t’avons invoqué dans notre monde pour que tu viennes à bout du démon qui nous hante !"],
	["… enfin surtout car cet empaffé de prêtre n’est pas capable de s’en occuper."],
	["Hum hum, nous avons effectivement besoin de toi mais nos activités doivent rester secrètes aux yeux du prêtre."],
	["En es tu capable oh héros ?"],
	["Pour briser la malediction, il faut tuer le démon d'une flèche dans le coeur, en êtes vous capable ?"]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
