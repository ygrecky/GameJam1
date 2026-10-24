extends Node2D
class_name Papier
@export var area : Area2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func destroy():
	Global.player.isTalking = false
	self.queue_free()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	for elt in area.get_overlapping_bodies():
		if(elt is Player and elt.action_just_pressed):
			await get_tree().create_timer(0.1).timeout
			print("Lecture de la feuille")
			if not Global.lettre_grimoire and not Global.player.object_unlocked[4]:
				Global.lettre_grimoire = true
			elif not Global.lettre_grimoire:
				print("lettre ramassée")
				Global.player.isTalking = true
				var bdd = load("res://scenes/boite_texte.tscn").instantiate()
				Global.player.feuilles_grimoire +=1
				
				bdd.dialogue = [["Vous ramassez la feuille de grimoire."], ["Il vous en manque " + str(Global.player.feuilles_grimoire_max - Global.player.feuilles_grimoire)]]
				if(Global.player.feuilles_grimoire_max ==Global.player.feuilles_grimoire):
					bdd.dialogue = [["Vous ramassez la feuille de grimoire."], ["Le grimoire est maintenant complet, vous pouvez le lire"]]
				bdd.ending_func = destroy
				Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
