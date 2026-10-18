extends Pnj


var se_deplace = false

func ending_func() : 
	$CollisionShape2D.disabled = true
	se_deplace = true
	velocity = Vector2(speed*2, 0)
	Global.game_controller.inventory.get_child(0).s1.add_objet()
	

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
	pnj_name = "Petite fille"
	dialogue = [["Bravo tu m'as attrapée à nouveau hihi !"],
	["Voici mon trésor !"]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if se_deplace:
		move_and_slide()
	if self.position.x > 1500 :
			self.queue_free()
