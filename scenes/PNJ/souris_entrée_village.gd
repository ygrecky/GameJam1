extends Pnj


func talk_to():
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	bdd.ending_func = ending_func
	
var se_deplace = false 

func ending_func() : 
	$CollisionShape2D.disabled = true
	se_deplace = true



func _ready() -> void:
	pnj_name = "Petite fille"
	dialogue = [["Voilà notre village ! C’est pas bien grand mais on y est heureux."],["Viens jouer à cache-cache avec moi ! Je suis rapide comme l'éclair!!!"]]
	speed = 3000
	direction_x = 1
	direction_y = 0 
	pass
	
	
func _physics_process(_delta: float) -> void :
	
	if se_deplace :
		velocity = Vector2(1, -0.1) * speed
		move_and_slide()
		
		if self.position.x > 2000 :
			self.queue_free()
