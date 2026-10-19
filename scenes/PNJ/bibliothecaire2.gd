extends Pnj

var nom_fichier = "bibliothécaire"

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
	dialogue = [["Bienvenue étranger !"],
	["Voici la collection de livre très anciens du village. Il contient tout le savoir accumulé jusqu'à présent"],
	["N'hésite pas à les lire, ils contiennent peut être des savoirs essentiels pour ta quête ! "]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
