extends Pnj


var se_deplace = false

func ending_func() : 
	Global.game_controller.inventory.get_child(0).s6.add_objet()
	Global.player.object_unlocked[5] = true
	

func talk_to():
	Global.speaker = "baronne"
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
	pnj_name = "Baronne"
	image_link = "res://assets/Personnages/cerf.png"
	dialogue = [["Je vois que tu as trouvé notre antre."],
	["Cet endroit est de toute beauté, mais pas aussi beau que moi"],
	["Nous nous réunissons pour résister contre démon caché parmis nous"],
	["Prenez ceci Héros, vous parviendrez peut être à déterminer qui c'est et l'éliminer pour de bon"]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
