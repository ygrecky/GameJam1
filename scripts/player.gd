extends CharacterBody2D
class_name Player
@export var speed = 300
@export var long_action_zone: Area2D
@export var short_action_zone : Area2D
@export var collision_ : Area2D
@export var collision_shape2d : CollisionShape2D
@export var sprite : Sprite2D

@export var camera : Camera2D
var music_ow
var music_house

var facing_x = 0
var facing_y = -1
var action_pressed = false
var action_just_pressed = false
var aimant_activé = false
@export var fleche_delay: float
var fleche_ready = true

var inTransition = false

var isTalking = false

var object_unlocked = [false,false,false,false,false,false]
var carreau = false
var actions_pressed = [false,false,false,false,false,false]
var soufleur_index = 0
var aimant_index = 1
var arbalette_index = 2
var arbalete = false
var demon = ""
var liste_perso = ["souris", "eusebio", "forgeron", "paysan", "prêtre", "baron", "baronne"]

var sound_effect

@export var aimant_acceleration = 0.1
@export var aimant_max_speed = 600
@export var interaction_label : Label

var barrone_aimant = false
var show_baronne2 = false

func demon_random():
	return liste_perso[randi_range(0, len(liste_perso)-1)]


func _ready():
	sound_effect = $AudioStreamPlayer2D3
	music_ow = $AudioStreamPlayer2D
	music_house = $AudioStreamPlayer2D2
	Global.player = self
	interaction_label.visible = false
	speed = 400
	demon = demon_random()

func get_input(delta):
	aimant_activé = actions_pressed[aimant_index]
	var direction_x = 0
	var direction_y = 0
	action_just_pressed = Input.is_action_just_pressed("action_1")
	if Input.is_action_pressed("action_1"):
		action_pressed = true
	else:
		action_pressed = false
	
		
	if(not(aimant_activé) or velocity == Vector2(0,0)):
		if Input.is_action_pressed("left"):
			rotation_degrees = 90
			sprite.rotation_degrees = -90
			direction_x = -1
			$Sprite2D.flip_h = false
			
			$Node2D.rotation_degrees = -90
			facing_x = -1
			facing_y = 0
		

			
		if Input.is_action_pressed("right"):
			rotation_degrees = -90
			sprite.rotation_degrees = 90
			direction_x = 1
			$Sprite2D.flip_h = true
			$Node2D.rotation_degrees = 90
			facing_x = 1
			facing_y = 0

			
		if Input.is_action_pressed("down"):
			rotation_degrees = 0
			sprite.rotation_degrees = 0
			direction_y = 1
			$Node2D.rotation_degrees = 0
			facing_x = 0
			facing_y = 1

			
		if Input.is_action_pressed("up"):
			rotation_degrees = 180
			sprite.rotation_degrees = 180
			direction_y = -1
			$Node2D.rotation_degrees = 180
			facing_x = 0
			facing_y = -1
		
	if Input.is_action_just_pressed("debug1"):
		Global.player.inTransition = true
		Global.game_controller.change_2d_scene("res://scenes/test_scene.tscn",false,true)
		
	if Input.is_action_just_pressed("debug2"):
		Global.player.inTransition = true
		Global.game_controller.change_2d_scene("res://scenes/game.tscn",false,true)
	if(not(aimant_activé)):
		velocity = Vector2(direction_x, direction_y) * speed*delta*60
	
func _process(delta: float) -> void:
	pass
		

func _physics_process(delta):

	var isPaused = isTalking
	if(not isPaused):
		for elt in short_action_zone.get_overlapping_bodies():
			if(elt is Pnj and action_just_pressed):
				isTalking = true
				elt.talk_to()
			
			if(elt is Biblio and action_just_pressed):
				isTalking=true
				elt.read()
		for elt in collision_.get_overlapping_bodies():
			if(elt!=self):
				print(elt)
		for elt in collision_.get_overlapping_areas():
			if(elt.get_parent() is TpZone and action_just_pressed):
				if(elt.get_parent().play_music_ow):
					music_ow.play()
				if(elt.get_parent().stop_music_ow):
					music_ow.stop()
				if(elt.get_parent().play_music_house):
					music_house.play()
				if(elt.get_parent().stop_music_house):
					music_house.stop()
				
				Global.game_controller.change_2d_scene(elt.get_parent().destination_path,false,true)
				
			
		
		get_input(delta)
		for i in range(6):
			if(actions_pressed[i] and object_unlocked[i]):
				use_object(i,delta)
				
		move_and_slide()

func use_object(index,delta):
	if(true):
		if(index == soufleur_index):
			for elt in short_action_zone.get_overlapping_bodies():
				if(elt is Feu):
					elt.grow(delta, facing_x, facing_y)
		
	if(index == aimant_index and actions_pressed):
		for elt in long_action_zone.get_overlapping_bodies():
			if(elt is BlocMagnetique):
				aimant_activé = true
				velocity = velocity + Vector2(facing_x,facing_y)*aimant_acceleration
	
	if(index==2):
		if(fleche_ready):
			fleche_ready = false
			
			if(carreau):
				print("ok")
				var fleche = load("res://scenes/flèche.tscn").instantiate()
				fleche_ready = false
				fleche.position = position 
				fleche.direction_x =facing_x
				fleche.direction_y = facing_y
				Global.game_controller.current_2d_scene.add_child(fleche)
			else:
				var bdd = load("res://scenes/boite_texte.tscn").instantiate()
				bdd.dialogue = [["Vous n'avez pas de carreau"]]
				Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
			await get_tree().create_timer(fleche_delay).timeout
			(func(): fleche_ready = true).call_deferred()
			
	if(index==5):
		if(true):
			print("test")
			for elt in short_action_zone.get_overlapping_bodies():
				if elt is Pnj:
					Global.showSceau = true
					var bdd = load("res://scenes/boite_texte.tscn").instantiate()
					bdd.dialogue = [["Voici le seau de cet habitant"]]
					Global.speaker = elt.pnj_name
					if(elt.pnj_name=="Petite fille"):
						Global.speaker = "souris"
					if(elt.pnj_name=="Orso le forgeron"):
						Global.speaker = "forgeron"
					if(elt.pnj_name=="Eusebio"):
						Global.speaker = "eusebio"
					if(elt.pnj_name=="Baron"):
						Global.speaker = "baron"
					if(elt.pnj_name=="Baronne"):
						Global.speaker = "baronne"
					if(elt.pnj_name=="Prêtre"):
						Global.speaker = "prêtre"
					if(elt.pnj_name=="Paysan" or elt.pnj_name=="Paysane"):
						Global.speaker = "paysan"
					if(elt.pnj_name=="Bibliothécaire "):
						bdd.dialogue = [["Ce villageois n'as pas de sceau"]]
						Global.showSceau = false
					
					
					Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
					
					
	if(index==6):
		Global.game_controller.restart_loop()
	if(index==3):
		var bdd = load("res://scenes/boite_texte.tscn").instantiate()
		bdd.dialogue = [["Un joli miroir, vous pouvez admirer votre beauté dans le reflet"]]
		Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
		




func _on_short_action_zone_body_entered(body: Node2D) -> void:
	if body is Pnj:
		#$Node2D/interaction_label/Label.visible = true
		interaction_label.visible = true
		interaction_label.text = "Parler (Espace)"
	
	if body is Biblio:
		interaction_label.visible = true
		interaction_label.text = "Lire (Espace)"
	

		
		


func _on_short_action_zone_body_exited(body: Node2D) -> void:
	if body is Pnj or body is Biblio:
		
		#$Node2D/interaction_label/Label.visible = false
		interaction_label.visible = false
		


func _on_player_area_entered(area: Area2D) -> void:
	if area.get_parent() is TpZone:
		interaction_label.visible = true
		interaction_label.text = "Entrer (Espace)"
	elif area.get_parent() is Papier:
		interaction_label.visible = true
		interaction_label.text = "Lire (Espace)"
	elif area.get_parent() is Aimant:
		interaction_label.visible = true
		interaction_label.text = "Récupérer (Espace)"
	elif area.get_parent() is Bottes:
		interaction_label.visible = true
		interaction_label.text = "Récupérer (Espace)"
		
	pass # Replace with function body.


func _on_player_area_exited(area: Area2D) -> void:
	if area.get_parent() is TpZone:
		interaction_label.visible = false
	elif area.get_parent() is Papier:
		interaction_label.visible = false
	elif area.get_parent() is Aimant or area.get_parent() is Bottes:
		interaction_label.visible = false
	pass # Replace with function body.
