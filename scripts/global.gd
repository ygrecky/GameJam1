extends Node
var game_controller : GameController
var player : Player
var time : int
var inMenu = true
var lettre_grimoire = false
var restart_boucle = true
var speaker = ""
var durée_boucle = 5


func finir_le_jeu():
	restart_boucle = true
	time = Time.get_ticks_msec() * 1000
	get_tree().create_timer(durée_boucle).timeout.connect(func() : finir_le_jeu())
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time = Time.get_ticks_msec() * 1000
	get_tree().create_timer(durée_boucle).timeout.connect(func() : finir_le_jeu())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
