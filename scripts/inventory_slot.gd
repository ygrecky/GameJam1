extends Control

@export var is_used = false
@export vas pos = 0

func _use_slot():
	is_used = true

func _free_slot():
	is_used = false
