extends StaticBody2D
class_name Feu
@export var scale_speed = 0.5
@export var max_scale = 0.5

@export var feu : PackedScene
var min_scale = 0.1
var childrens = [false,false,false,false]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(0,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(scale< Vector2(min_scale,min_scale)):
		scale +=  scale_speed*delta*Vector2(1,1)
	pass
	
func grow(delta, player_rot):
	##if(scale< Vector2(max_scale,max_scale)):
	##	scale +=  scale_speed*delta*Vector2(1,1)
	##else:
		var rotation_index = player_rot/90
		if(not(childrens[rotation_index])):
			var dx=0
			var dy=0
			if(rotation_index==0):
				dy=-1
			if(rotation_index==1):
				dx=1
			if(rotation_index==2):
				dy=1
			if(rotation_index==3):
				dx=-1
			##var child = feu.instantiate()
			##child.position = position + Vector2()
			
	
	
	
	
