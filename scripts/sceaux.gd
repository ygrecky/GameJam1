extends Node



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$sceaux.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (not Global.inMenu) and (Global.player.isTalking or Global.showSceau) and (not Global.restart_boucle):
		if Global.speaker == Global.player.demon and not(Global.showSceau):
			$sceaux/sceaux_texture.texture = load("res://assets/Sceaux/"+Global.player.demon+" démon.png")
		else:
			$sceaux/sceaux_texture.texture = load("res://assets/Sceaux/"+Global.speaker+".png")
		$sceaux.visible = true
	else:
		$sceaux.visible = false
