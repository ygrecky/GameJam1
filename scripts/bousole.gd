extends Node2D

@export var aiguille : Node2D
@export var target1 : Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(not(Global.player.object_unlocked[1])):
		aiguille.look_at(target1.position)
	else:
		aiguille.look_at(Global.player.position)
	pass
