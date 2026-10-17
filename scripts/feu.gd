extends StaticBody2D
class_name Feu
@export var scale_speed = 0.5
@export var max_scale = 0.5

@export var feu : PackedScene
var min_scale = 0.1
var current_child = [self,self,self,self]
var can_have_child = [true,true,true,true]
@export var child_spacing = 80
@export var random_propag = 20
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
	var rotation_index = 0
	if(player_facingX==1):
		rotation_index=1
	if(player_facingX==-1):
		rotation_index=3
	if(player_facingY==1):
		rotation_index=2
	if(current_child[rotation_index].scale< Vector2(max_scale,max_scale)):
		current_child[rotation_index].scale +=  scale_speed*delta*Vector2(1,1)
	else:
		if(can_have_child[rotation_index]):
			
			var child = duplicate()
			
			child.position = current_child[rotation_index].position + Vector2(player_facingX*child_spacing +randi_range(-random_propag,random_propag), player_facingY*child_spacing +randi_range(-random_propag,random_propag))
			child.can_have_child[rotation_index] = false
			current_child[rotation_index] = child
			get_parent().add_child.call_deferred(child)
			##get_tree().root.add_child.call_deferred(child)
			
	
	
	
	
