extends Node
var game_controller : GameController
var player : Player
var time : int
var inMenu = true
var lettre_grimoire = false
var restart_boucle = true
var speaker = ""
var durée_boucle = 210
var last_answer = 0
var showSceau = false
var ecran_de_fin = true


func finir_le_jeu():
	if (Global.time - Time.get_ticks_msec()) * 1000 >= durée_boucle and !ecran_de_fin:
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
