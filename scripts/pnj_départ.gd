extends Pnj
class_name Pnj_depart


var se_deplace = false

func ending_func() : 
	$CollisionShape2D.disabled = true
	se_deplace = true
	



func talk_to():
	print(self)
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	bdd.ending_func = ending_func
	


func _ready() -> void:
	image_link = "res://assets/Personnages/souris.jpg"
	sprite.texture = load(image_link)
	var speed = 75
	
func _physics_process(_delta: float) -> void :
	
	if se_deplace :
		velocity = Vector2(1, 0) * speed
		move_and_slide()
		
		if self.position.x > 1500 :
			self.queue_free()
