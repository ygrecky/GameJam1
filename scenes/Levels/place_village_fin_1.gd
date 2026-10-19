extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_orso_tree_entered() -> void:
	Global.player.position = Vector2(3300,1500)
	$orso.talk_to()
	Global.game_controller.switch_to_menu()
	self.queue_free()
