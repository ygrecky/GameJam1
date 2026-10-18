extends Pnj


var se_deplace = false

func ending_func() : 
	$CollisionShape2D.disabled = true

func talk_to():
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	bdd.ending_func = ending_func


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pnj_name = "Orso le forgeron"
	print("skibidi")
	dialogue = [["Eh BAH! Comment je fais moi pour forger si j’peux même pas souffler mon feu!!"],
	["C’est toi qui a volé mon soufflet l’inconnu ?"], ["Mais qu’est ce que tu veux? Moi j’peux pas t’aider j’peux même pas travailler ! Alors fiche moi le camp !"]]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
