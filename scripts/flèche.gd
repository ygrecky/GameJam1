extends CharacterBody2D
class_name Fleche
var direction_x =1
var direction_y = 0
var speed = 500


@export var hurt_box : Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta) -> void:
	velocity = delta*speed*Vector2(direction_x,direction_y)*60
	for elt in hurt_box.get_overlapping_bodies():
		if(not(elt is Ravin) and not(elt is Player)):
			print("flèche a touché")
			print(elt)
			if(elt is Pnj and elt.nom_fichier != Global.player.demon):
				Global.game_controller.sound_effect.play()
				elt.dialogue = [["AAAAAAAAARG... L'étranger m'attaque, au secours..."]]
				Global.player.isTalking = true
				elt.talk_to_bis(func end_func() : 
					Global.restart_boucle = true)
			elif(elt is Pnj and elt.nom_fichier == Global.player.demon):
				Global.game_controller.sound_effect.play()
				elt.dialogue = [["COMMENT AS TU SU ????? C'est impossible, je ne peux pas mourrir, nonnnnnnnnnnnn"]]
				Global.player.isTalking = true
				elt.talk_to_bis(func end_func() : 
					Global.game_controller.fin_jeu.visible = true
					Global.game_controller.switch_to_menu())
			queue_free()
	move_and_slide()
	pass


func _on_hidden() -> void:
	queue_free()
	pass # Replace with function body.
