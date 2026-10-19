extends Node2D
class_name  Aimant
@export var zone : Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	for elt in zone.get_overlapping_bodies():
		if(elt is Player and elt.action_just_pressed ):
			Global.game_controller.inventory.get_child(0).s2.add_objet()
			Global.player.object_unlocked[1] = true
			queue_free()
	pass
