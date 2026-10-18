extends CharacterBody2D
class_name Pnj

@export var text_box: PackedScene


var pnj_name = "Grand Maistre"
var direction_x = -1
var direction_y = 0
var speed = 200

var dialogue = [["test"],["test"],["aaaazaaaa"]]

func ending_func() : pass
@export var image_link : String
@export var sprite : Sprite2D


func talk_to():
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	Global.game_controller.current_2d_scene.add_child.call_deferred(bdd)
	bdd.ending_func = ending_func
	


func _ready() -> void:
	sprite.texture = load(image_link)
	pass
	
func _process(delta: float) -> void:
	pass
