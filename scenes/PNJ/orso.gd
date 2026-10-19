extends Pnj

var nom_fichier = "forgeron"

var se_deplace = false
var forgé = false

func unlock_miroir():
	Global.game_controller.inventory.get_child(0).s4.add_objet()
	forgé = true
	Global.player.object_unlocked[3] = true

func unlock_carreau():
	Global.player.carreau = true
	forgé = true
func talk_to():
	Global.speaker = "forgeron"
	var bdd = text_box.instantiate()
	if(not(Global.player.object_unlocked[0])):
		dialogue = [["Eh BAH! Comment je fais moi pour forger si j’peux même pas souffler mon feu!!"],
		["C’est toi qui a volé mon soufflet l’inconnu ?"], ["Qu’est ce que tu veux? Moi j’peux pas t’aider j’peux même pas travailler ! Alors fiche moi le camp !"]]
	elif(not(forgé)):
		if(Input.is_action_pressed("A")):
			dialogue = [["Excellent choix ! Voici ton miroir !"], ["A la revoyure mon bonhomme"]]
			unlock_miroir()
		elif(Input.is_action_pressed("E")):
			dialogue = [["Hmmm notre étranger est un tueur, soit. Voici ton carreau, utilise le à bon escient."], ["A la revoyure mon bonhomme"]]
			unlock_carreau()
		else:
			dialogue = [["Eh mais c'est mon soufflet !!"], ["Et tu dis que c'est cette chipie de souris qui l'avait ?"], ["La prochaine fois que je la vois elle va voir de quel bois je me chauffe..."], ["Enfin bref, merci étranger !"],["Avec ce soufflet et ma forge, je peut te fabriquer une technologie pour t'aider dans ton aventure :"], ["Un magnifique miroir réfléchissant, ma dernière invention, qui permet à celui qui le porte de s'admirer lui même"], ["Ou bien un carreau d'arbalette, si tu te sens d'humeur chasseuse."], ["( Parlez à Orso en maintenant A si vous voulez le miroir, ou E si vous voulez le carreau)"]]
	
	else:
		dialogue = [["Tu en redemande ? Je ne peut plus rien pour toi petit, va et vogue vers l'inconnu !"], ["Je te laisse mon soufflet pour l'instant, mais fait attention, c'est dangereux de jouer avec le feu..."]]
	
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	bdd.ending_func = ending_func


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pnj_name = "Orso le forgeron"
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
