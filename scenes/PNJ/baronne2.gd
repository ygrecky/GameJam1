extends Pnj



var se_deplace = false
var traversé = false
var aimant_acceleration = Global.player.aimant_acceleration

func ending_func() : 
	se_deplace = true
	Global.player.barrone_aimant = true
	velocity = speed*Vector2(0,1)
	move_and_slide()
	

func talk_to():
	Global.speaker = "baronne"
	
	dialogue = [["Ces blocs de métal très anciens ont d'étrange propriétes :"],
	["Quand j'oriente l'aimant vers eux, je ressens une force énorme qui s'applique"],
	["La force est si puissante qu'elle me permet de traverser ce gouffre, regardez donc !"]]
	
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	bdd.ending_func = ending_func


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pnj_name = "Baronne"
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(Global.player.show_baronne2):
		position = Vector2(1832.0,-2321.0)
		Global.player.show_baronne2 = false
	if(se_deplace):
		if(position.y< -2700 and not(traversé)):
			Global.player.barrone_aimant = false
			traversé = true
		elif not(traversé):
			velocity = velocity + Vector2(0,-1)*aimant_acceleration
			Global.player.barrone_aimant = true
		else:
			position = Vector2(2257.0,-2757.0)
		
		move_and_slide()
	pass
