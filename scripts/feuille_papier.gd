extends Node2D
class_name Papier
@export var area : Area2D
@export var readable : bool
var deja_lu = false



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
			elt.action_just_pressed = false
			print("Lecture de la feuille")
			if not Global.lettre_grimoire and not Global.player.object_unlocked[4]:
				if(readable and not(deja_lu)):
					Global.lettre_grimoire = true
					deja_lu = true
					
				elif not(deja_lu):
					var bdd = load("res://scenes/boite_texte.tscn").instantiate()
					bdd.dialogue = [["Vous ne comprenez pas un mot de ce que vous lisez"]]
					Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
				else:
					var bdd = load("res://scenes/boite_texte.tscn").instantiate()
					bdd.dialogue = [["Vous avez déjà essayé de lire cette lettre..."]]
					Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
			elif not Global.lettre_grimoire:
				print("lettre ramassée")
				if(readable):
					Global.player.feuille_283 = true
				Global.player.isTalking = true
				var bdd = load("res://scenes/boite_texte.tscn").instantiate()
				Global.player.feuilles_grimoire +=1
				
				bdd.dialogue = [["Vous ramassez la feuille de grimoire."], ["Il vous en manque " + str(Global.player.feuilles_grimoire_max - Global.player.feuilles_grimoire)]]
				if(Global.player.feuilles_grimoire_max ==Global.player.feuilles_grimoire):
					bdd.dialogue = [["Vous ramassez la feuille de grimoire."], ["Le grimoire est maintenant complet, vous pouvez le lire"]]
				bdd.ending_func = destroy
				Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
