extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.lettre_grimoire:
		visible = true
		Global.player.isTalking = true
	
	if(Global.lettre_grimoire):
		if Input.is_action_just_pressed("action_1"):
			visible = false
			Global.player.isTalking = false
			Global.lettre_grimoire = false
		
