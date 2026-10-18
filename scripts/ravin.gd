extends StaticBody2D
class_name Ravin
@export var collision_ : CollisionShape2D
@export var area : Area2D
var player : Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = Global.player
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(Global.player.aimant_activé):
		collision_.disabled = true
	else:
		collision_.disabled = false
	
	for elt in area.get_overlapping_bodies():
		if(elt is Player and not(elt.aimant_activé) and not(Global.player.inTransition)):
			print("mort : Tombé dans le ravin")
			
	pass
