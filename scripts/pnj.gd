extends CharacterBody2D
class_name Pnj
@export var text_box: PackedScene
var pnj_name = "Grand Maistre"
var dialogue = ["Bonjour ","Comment vas tu?","QuOIIIIIIIIIIII","CIAO"]



func talk_to():
	var bdd = text_box.instantiate()
	bdd.speakerPnj = self
	bdd.dialogue = dialogue
	bdd.speaker2 = pnj_name
	bdd.sprite2 = $Sprite2D.texture
	get_tree().root.add_child.call_deferred(bdd)


func _ready() -> void:
	talk_to()
	
func _process(delta: float) -> void:
	pass
