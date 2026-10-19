extends Pnj

var nom_fichier = "souris"
var se_deplace = false

func ending_func() : 
	$CollisionShape2D.disabled = true
	se_deplace = true
	velocity = Vector2(speed*2, speed)
	

func talk_to():
	Global.speaker = "souris"
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
	speed =1000
	dialogue = [["Oh tu m’as trouvé hihi ! Si tu m’attrapes une fois de plus je te montrerai mon trésor."]]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if se_deplace:
		move_and_slide()
