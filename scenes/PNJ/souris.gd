extends Pnj
var se_deplace = false
func ending_func() : 
	$CollisionShape2D.disabled = true
	se_deplace = true


func talk_to():
	Global.speaker = "souris"
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	bdd.ending_func = ending_func
	




func _ready() -> void:
	pnj_name = "Petite fille"
	dialogue = [["Bonjour ! Vous m’avez l’air perdu monsieur le renard laissez moi vous guider vers la place du village"]]
	speed = 300
	direction_x = 1
	direction_y = 0 
	pass
	
	
func _physics_process(_delta: float) -> void :
	
	if se_deplace :
		velocity = Vector2(1, 0) * speed
		move_and_slide()
		
		if self.position.x > 1500 :
			self.queue_free()
