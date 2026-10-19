extends Pnj


var se_deplace = false

func ending_func() : 
	Global.game_controller.switch_to_menu()
	

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
	pnj_name = "panda"
	dialogue = [['Merci...'],['Vous nous avez sauver des griffes du démon'],['Vous ne pourrez plus jamais rentré, mais vous êtes le bienvenu à jamais']]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
