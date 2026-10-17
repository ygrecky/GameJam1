extends CharacterBody2D
@export var TextBox: PackedScene

var dialogue = []


func talk_to():
	var bdd = TextBox.instantiate()
	bdd.dialogue = dialogue
	get_tree().root.add_child.call_deferred(bdd)


func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass
