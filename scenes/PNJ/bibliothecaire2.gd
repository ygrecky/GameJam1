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
	dialogue = [["Welcome stranger!","Bienvenue étranger !"],
	["Here is my modest collection of the very old books from the village. It contains all the knowledge gathered until this very moment.","Voici ma modeste collection de livre très anciens du village. Il contient tout le savoir accumulé jusqu'à présent"],
	["Although I have to admit, I had to make some cleaning. There were books like 'How to see your life expectancy with the touch T ' that didn't make any sense","Enfin, j'ai dû faire un peu de tri quand même, il y avait des livres comme ''Voir son espérance de vie avec la touche T'' qui n'avaient vraiment aucun sens..."],
	["Anyway! Don't mind me and read to your heart's content. My books contain all you need to know to complete your quest","Bref, n'hésite pas à lire mes livres, ils contiennent peut être des savoirs essentiels pour ta quête ! "]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
