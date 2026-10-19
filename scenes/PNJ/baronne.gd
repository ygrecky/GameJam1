extends Pnj


var se_deplace = false

func ending_func() : 
	Global.player.show_baronne2 = true
	
	

func talk_to():
	Global.speaker = "baronne"
	if(not(Global.player.object_unlocked[3])):
		dialogue = [["NON CE N’EST PLUS POSSIBLE"],
		["ÇA ne peut pas continuer. Tous ces serviteurs, pleins de compliments… Plutôt plein de mensonge je dirais."],
		["Je ne vois aucune sincérité chez eux. Humpf"],
		["Ce fichu Euzebio n'est-il pas fichu de dire une vérité une fois dans sa vie ?"],
		["Comment je peux savoir combien je suis ravissante si personne de fiable ne m'entoure ?"]]
	else:
		dialogue = [["Eh mais c'est mon miroir que je voit là ?"], ["DONNEZ LE MOI !"], ["Ah, ça fait du bien de te revoir, Camélia. Toujours aussi belle à ce que je vois"], ["Merci, étranger. Je vois que vous, vous êtes digne de confiance !"], ["Pour vous remercier, laissez moi vous montrer quelque chose, rejoignez moi au ravin."]]
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
