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
	dialogue = [["NON CE N’EST PLUS POSSIBLE"],
	["ÇA ne peut pas continuer. Tous ces serviteurs, pleins de compliments… Plutôt plein de mensonge je dirais."],
	["Je ne vois aucune sincérité chez eux. Humpf"],
	["Comment je peux savoir combien je suis ravissante ?"], 
	["si personne de fiable ne m’entoure ?"]]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
