extends CanvasLayer
class_name TextBox 
@onready var text = $Control/VBoxContainer/Text
@onready var speaker = $Control/VBoxContainer/Name
@onready var sprite = $Control/VBoxContainer/SpriteCharacter
@onready var state = $Control





var speakerPnj : Pnj
var text_number = 0
var dialogue = []
var speaker2 = ""
var sprite2 

func open_window(dialogue): #ouvre la boite de dialogue
	state.show()
	text_number = -1
	Next()

func Next() -> void: #passe d'un dialogue à un autre
	text_number += 1
	
	if text_number < dialogue.size():

		text.text = ""  #rafraichit la boite de dialogue
		add_letters(dialogue[text_number],0,text_number) #la remplit
	
	else:
		Global.player.isTalking = false
		close_window()
	

func add_letters(target,avancement, version):
	if version == text_number :
		text.text += target[avancement]
		print(text.text)
		avancement += 1
		
		if avancement != target.length():
			get_tree().create_timer(0.05).timeout.connect(func() : add_letters(target,avancement,version))
		
	



func close_window():
	state.hide()
	self.queue_free()
	

		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	open_window(dialogue)
	
	print(sprite2)
	speaker.text = speaker2
	sprite.texture = sprite2
	sprite.scale = Vector2(0.05,0.05)
	
	print(sprite)
	print($Sprite2D)
	
	print($Control/VBoxContainer/SpriteCharacter)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
