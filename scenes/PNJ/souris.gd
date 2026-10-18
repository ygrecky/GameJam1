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
	sprite.texture = load(image_link)
	pass
	
func _process(delta: float) -> void:
	pass
