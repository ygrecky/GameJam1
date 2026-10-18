extends Pnj








func talk_to():
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	bdd.ending_func = ending_func
	


func _ready() -> void:
	pnj_name = "Petite fille"
	dialogue = [["Bonjour ! Vous m’avez l’air perdu monsieur le renard laissez moi vous guider vers la place du village"],["Voilà notre village ! C’est pas bien grand mais on y est heureux."], ["Je ne devrais peut être pas révéler ça à un étranger mais mes parents m’ont dit qu’un horrible démon a pris possession d’un villageois !! Ah mais voilà M. le prêtre qui arrive il vous expliquera ça mieux que moi."],["Venez jouer à cache-cache avec moi !"]]
	
	pass
	
func _process(delta: float) -> void:
	pass
