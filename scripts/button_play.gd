extends Button


func _on_pressed() -> void:
	Global.game_controller.delete_menu()
	Global.game_controller.change_2d_scene(Global.game_controller.first_level, true)
	
