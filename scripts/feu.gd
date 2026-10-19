extends StaticBody2D
class_name Feu
@export var scale_speed = 0.5
@export var max_scale = 0.5

@export var feu : PackedScene
@export var min_scale = 0.1
var current_child = [self,self,self,self]
var can_have_child = [true,true,true,true]
var child_spacing = 80
var random_propag = 20

@export var zone : Area2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(0,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(scale< Vector2(min_scale,min_scale)):
		scale +=  scale_speed*delta*Vector2(1,1)
	
	for elt in zone.get_overlapping_bodies():
		if elt is Pnj:
			Global.game_controller.sound_effect.play()
			Global.player.isTalking = true
			elt.dialogue = [["AAAAAAAAARG... Je brule au secours !! Qu'on banisse l'étranger sur le champ !"]]
			Global.player.isTalking = true
			elt.talk_to_bis(func end_func() : 
				Global.restart_boucle = true)
		if elt is Arbre:
			Global.player.isTalking = true
			var bdd = load("res://scenes/boite_texte.tscn").instantiate()
			bdd.dialogue = [["Au feu !! L'étranger met feu à la forêt, qu'on le banisse immédiatement !!"]]
			bdd.ending_func = (func  end_func(): Global.restart_boucle = true)
			Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
		if elt is Maison:
			Global.player.isTalking = true
			var bdd = load("res://scenes/boite_texte.tscn").instantiate()
			bdd.dialogue = [["Au feu !! L'étranger met feu à nos maisons, qu'on le banisse immédiatement !!"]]
			bdd.ending_func = (func  end_func(): Global.restart_boucle = true)
			Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
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
			
	
	
	
	
