extends CanvasLayer
class_name TextBox2
@onready var text = $Control/VBoxContainer/Text
@onready var speaker = $Control/VBoxContainer/Name
@onready var sprite = $Control/VBoxContainer/SpriteCharacter
@onready var state = $Control





var speakerPnj : Pnj
var text_number = 0
var dialogue = []
var speaker2 = ""
var sprite2 
var ending_func = func() : pass

func open_window(dialogue, ending_func = func() : pass): #ouvre la boite de dialogue
	Global.player.isTalking = true
	state.show()
	text_number = -1
	Next(ending_func)

func Next(ending_func) -> void: #passe d'un dialogue à un autre
	text_number += 1
	
	if text_number < dialogue.size():
		
		set_speaker(dialogue[text_number][0])
		text.text = ""  #rafraichit la boite de dialogue
		add_letters(dialogue[text_number],0,text_number) #la remplit
	
	else:
		Global.player.isTalking = false
		close_window(ending_func)
	

func add_letters(target,avancement, version):
	if version == text_number :
		text.text += target[avancement]
		avancement += 1
		
		if avancement != target.length():
			get_tree().create_timer(0.05).timeout.connect(func() : add_letters(target,avancement,version))
		
	



func close_window(ending_func):
	state.hide()
	ending_func.call()
	self.queue_free()
	
func set_speaker(speaker) :
	speaker.text = speaker
	sprite.texture = "res://assets/Personnages/"+speaker+".jpg"
	sprite.scale = Vector2(0.05,0.05)
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	open_window(dialogue,ending_func)
	
	sprite.texture = sprite2
	sprite.scale = Vector2(0.05,0.05)
	
	print($Sprite2D)
	
	print($Control/VBoxContainer/SpriteCharacter)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
