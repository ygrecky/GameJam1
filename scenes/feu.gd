extends StaticBody2D
class_name Feu
@export var scale_speed = 0.5
@export var max_scale = 0.5

@export var feu : PackedScene
var min_scale = 0.1
var childrens = [false,false,false,false]
@export var child_spacing = 40
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(0,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(scale< Vector2(min_scale,min_scale)):
		scale +=  scale_speed*delta*Vector2(1,1)
	pass
	
func grow(delta, player_facingX, player_facingY):
	if(scale< Vector2(max_scale,max_scale)):
		scale +=  scale_speed*delta*Vector2(1,1)
	else:
		var rotation_index = 0
		if(player_facingX==1):
			rotation_index=1
		if(player_facingX==-1):
			rotation_index=3
		if(player_facingY==1):
			rotation_index=2
		
		if(not(childrens[rotation_index])):
			childrens[rotation_index]=true
			
			
			var child = duplicate()
			
			child.position = position + Vector2(player_facingX*child_spacing, player_facingY*child_spacing)
			get_tree().root.add_child.call_deferred(child)
			
	
	
	
	
