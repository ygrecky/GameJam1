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
	
	
	
func ending_func():
	match Global.last_answer:
		2:
			unlock_miroir()
			print("unlock mirroir")
		1:
			unlock_carreau()
			print('unlock carreau')
		_:
			pass
	
func talk_to():
	Global.speaker = "forgeron"
	var bdd = text_box.instantiate()
	if(not(Global.player.object_unlocked[0])):
		dialogue = [["YIKES YIKES, how can I work if I can't stoke my fire?! ","Eh BAH! Comment je fais moi pour forger si j’peux même pas souffler mon feu!!"],
		["Is it you who stole my bellow, stranger?","C’est toi qui a volé mon soufflet l’inconnu ?"], ["What do you want? I can't help you, I can't even just work by gum! Now just get out","Qu’est ce que tu veux? Moi j’peux pas t’aider j’peux même pas travailler ! Alors fiche moi le camp !"]]
	elif(not(forgé)):


		dialogue = [["Hey, isn't it my bellow?","Eh mais c'est mon soufflet !!"], ["So you ar saying that it is this troublemaker of a mouse who had it?","Et tu dis que c'est cette chipie de souris qui l'avait ?"], ["The next time I see her, she will see with which wood I'm burning!","La prochaine fois que je la vois elle va voir de quel bois je me chauffe..."], ["Anyway, thank you stranger","Enfin bref, merci étranger !"],["With my bellow and my forge, I can help you with a technologie to help you :","Avec ce soufflet et ma forge, je peut te fabriquer une technologie pour t'aider dans ton aventure :"], ["A beautiful miror, my last invention, which allows anybody to admire itself","Un magnifique miroir réfléchissant, ma dernière invention, qui permet à celui qui le porte de s'admirer lui même"], ["Or some crossbow bolts, if you feel like hunting","Ou bien un carreau d'arbalette, si tu te sens d'humeur chasseuse."],
		["Excellent choice, here is your mirror!","Hmmmmm, our stranger is a killer, very well! Here is some bolts, use them carefully","chose the bolts","chose the miror","Excellent choix ! Voici ton miroir !","Hmmm notre étranger est un tueur, soit. Voici ton carreau, utilise le à bon escient.","choisir le carreau","choisir le miroir"],
		["See you soon, old friend","A la revoyure mon bonhomme"]]
	
	else:
		dialogue = [["You want more? I'm afraid I can't help you anymore, little guy. You'll have to live your own adventure!","Tu en redemande ? Je ne peut plus rien pour toi petit, va et vogue vers l'inconnu !"], ["Je te laisse mon soufflet pour l'instant, mais fait attention, c'est dangereux de jouer avec le feu..."]]
	
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
