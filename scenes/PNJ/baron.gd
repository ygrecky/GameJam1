extends Pnj


var se_deplace = false

func ending_func() : 
	$CollisionShape2D.disabled = true
	se_deplace = true
	velocity = Vector2(speed*2, 0)
	

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
	pnj_name = "Baron"
	dialogue = [["Parlons des choses vraiment importantes… la chasse!!!"],
	["Est ce que cette merveille est pratiquée dans tes contrées Voyageur ?"],
	["Ah mais quel plaisir de savoir que nous partageons une telle passion."],
	["Comme gage de mon amitié permet moi de t’offrir mon arbalète."],
	["A mon grand désespoir, je n’ai plus de carreaux."],
	["Mais tu pourras peut-être en récupérer chez notre (mauvais) forgeron s’il daigne ne pas être méprisant comme à son habitude."]
	]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
