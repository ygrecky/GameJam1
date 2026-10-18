extends Node
var s1
var s2
var s3
var s4
var s5
var s6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = true
	s1 = $Inventaire_grid/Slot_1
	s2 = $Inventaire_grid/Slot_2
	s3 = $Inventaire_grid/Slot_3
	s4 = $Inventaire_grid/Slot_4
	s5 = $Inventaire_grid/Slot_5
	s6 = $Inventaire_grid/Slot_6


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.inMenu or Global.player.isTalking:
		self.visible = false
	else:
		self.visible = true
