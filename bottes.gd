extends Node2D
class_name Bottes

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	for elt in $Area2D.get_overlapping_bodies():
		if(elt is Player and elt.action_just_pressed ):
			var bdd = load("res://scenes/boite_texte.tscn").instantiate()
			bdd.dialogue = [["Vous trouvez des bottes, une technologie très ancienne qui augmente grandement votre vitesse"]]
			Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
			elt.speed = 600
			queue_free()
	pass
