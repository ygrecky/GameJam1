extends Node2D

@onready var horloge: Sprite2D = $horloge
@onready var aiguille: Sprite2D = $aiguille/Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.restart_boucle = false
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.restart_boucle == true:
		visible  = true
		Global.player.isTalking = true
		Global.player.position = aiguille.position
		$aiguille.rotate(-0.1)
		set_position(Global.player.position)
		Global.player.camera.zoom = Vector2(Global.player.camera.zoom.x*1.006, Global.player.camera.zoom.y*1.006)
		if Global.player.camera.zoom.x > 2:
			Global.restart_boucle = false
			visible = false
			Global.game_controller.restart_loop()
