extends Pnj


var nom_fichier = "paysan"
var se_deplace = false

func ending_func() : 
	pass
	

func talk_to():
	Global.speaker = "paysan"
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
	pnj_name = "Paysane"
	image_link = "res://assets/Personnages/cerf.png"
	dialogue = [
	["Miaou"],
	["C'est terrible cette malédiction... Qu'allons nous devenir ?"],
	["On raconte qu'un démon rode autour du village, et que si nous ne le trouvons pas au plus vite, nous serons perdus..."],
	["Aidez nous, je vous en supplie..."]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
