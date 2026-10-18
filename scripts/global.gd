extends Node
var game_controller : GameController
var player : Player
var time : int
var inMenu = true
var lettre_grimoire = false

func lancer_la_messe():
	
	
	get_tree().create_timer(180.0).timeout.connect(func() : finir_le_jeu())
	
func finir_le_jeu():
	pass	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time = Time.get_ticks_msec() * 1000
	get_tree().create_timer(180.0).timeout.connect(func() : lancer_la_messe())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
