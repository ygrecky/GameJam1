extends Pnj

var nom_fichier = "baronne"

var se_deplace = false


	
	

func talk_to():
	Global.speaker = "baronne"
	if(not(Global.player.object_unlocked[3])):
		dialogue = [["NO!! I CAN'T TAKE IT ANYMORE","NON CE N’EST PLUS POSSIBLE"],
		["It can't continue. All this shallow servants, full of praise... full of lies!","ÇA ne peut pas continuer. Tous ces serviteurs, pleins de compliments… Plutôt plein de mensonge je dirais."],
		["How can they be so unreliable.","Je ne vois aucune sincérité chez eux. Humpf"],
		["Especially Euzebio. Will he say at least once the truth in his life?","Ce fichu Euzebio n'est-il pas fichu de dire une vérité une fois dans sa vie ?"],
		["How can I know how ravishing I am, if I have no one next to me","Comment je peux savoir combien je suis ravissante si personne de fiable ne m'entoure ?"]]
	else:
		Global.player.show_baronne2 = true
		dialogue = [["Is it my miror that tou have???!","Eh mais c'est mon miroir que je voit là ?"], ["GIVE IT TO ME !","DONNEZ LE MOI !"], ["Ah... What a pleasure to see you again Camelia. You are as beautiful as usual","Ah, ça fait du bien de te revoir, Camélia. Toujours aussi belle à ce que je vois"], ["Thank you, stranger. I can see that you, at least, are worthy of my confidence!","Merci, étranger. Je vois que vous, vous êtes digne de confiance !"], ["As a token of my gratefulness, let me show you something. Meet me next to the ravine","Pour vous remercier, laissez moi vous montrer quelque chose, rejoignez moi au ravin."]]
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	bdd.ending_func = ending_func


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pnj_name = "Baronne"
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
