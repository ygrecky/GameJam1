extends Node
var game_controller : GameController
var player : Player
var time : int
var inMenu = true
var lettre_grimoire = false
var resart_boucle : Node2D
var speaker = ""


func finir_le_jeu():
	Global.resart_boucle.visible = true
	time = Time.get_ticks_msec() * 1000
	get_tree().create_timer(180).timeout.connect(func() : finir_le_jeu())
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time = Time.get_ticks_msec() * 1000
	get_tree().create_timer(180).timeout.connect(func() : finir_le_jeu())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
