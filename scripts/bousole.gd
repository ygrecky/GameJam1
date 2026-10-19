extends Node2D

@export var aiguille : Node2D
@export var target1 : Node2D
var target2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(Global.player.demon == "souris"):
		target2 = Vector2(4532.0,1855.0)
	if(Global.player.demon == "eusebio"):
		target2 = Vector2(0,0)
	if(Global.player.demon == "forgeron"):
		target2 = Vector2(1676.0,331.0)
	if(Global.player.demon == "paysan"):
		target2 = Vector2(1537.0,-184.0)
	if(Global.player.demon == "prêtre"):
		target2 = Vector2(2989.0,1513.0)
	if(Global.player.demon == "baron"):
		target2 = Vector2(1575.0,1960.0)
	if(Global.player.demon == "baronne"):
		target2 = Vector2(1575.0,1960.0)
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(not(Global.player.object_unlocked[1])):
		aiguille.look_at(target1.position)
	else:
		aiguille.look_at(target2)
	pass
