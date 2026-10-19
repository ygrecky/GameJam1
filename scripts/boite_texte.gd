''' Une boite de dialogue est souvent crée par des pnjs avec la fonction talk_to. 
La variable des Pnjs "dialogue" est un array d'Array, chaque Array étant le texte d'une boite de texte
C'est soit un singleton, soit une réponse à choix multiple '''


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
var ending_func = func() : pass
var reponse = 0


func toggle_button(state):
	$Control/VBoxContainer/Button.visible = state
	$Control/VBoxContainer/HBoxContainer.visible = !state
	
func open_window(dialogue, ending_f = func() : pass): #ouvre la boite de dialogue
	Global.last_answer = 0
	state.show()
	text_number = -1
	Next()
	ending_func = ending_f

func Next(n=0) -> void: #passe d'un dialogue à un autre

	text_number += 1
	
	if text_number >= dialogue.size():
		Global.player.isTalking = false
		close_window(ending_func)
	
	
	elif text_number == dialogue.size() - 1 :
		reponse = 0
		toggle_button(true)
		text.text = ""  #rafraichit la boite de dialogue
		add_letters(dialogue[text_number][n-1],0,text_number) #la remplit
		
	else:
		if dialogue[text_number+1].size() > 1 :
			reponse = -1
			toggle_button(false)
			$Control/VBoxContainer/HBoxContainer/Button1.text = dialogue[text_number+1][2]+ " (1)"
			$Control/VBoxContainer/HBoxContainer/Button2.text = dialogue[text_number+1][3]+ " (2)"
			text.text = ""  #rafraichit la boite de dialogue
			add_letters(dialogue[text_number][n-1],0,text_number) #la remplit
			
		else :
			reponse = 0
			toggle_button(true)
			text.text = ""  #rafraichit la boite de dialogue
			add_letters(dialogue[text_number][n-1],0,text_number) #la remplit
				
	

func add_letters(target,avancement, version):
	if version == text_number :
		text.text += target[avancement]
		avancement += 1
		
		if avancement != target.length():
			get_tree().create_timer(0.006).timeout.connect(func() : add_letters(target,avancement,version))
		
	



func close_window(ending_func):
	state.hide()
	ending_func.call()
	self.queue_free()
	Global.showSceau = false
	

		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toggle_button(true)
	open_window(dialogue,ending_func)
	
	speaker.text = speaker2
	sprite.texture = sprite2
	sprite.scale = Vector2(0.05,0.05)
	

	

	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("action_1") and reponse == 0:
		Next()
		
	if reponse == -1 and Input.is_action_just_pressed("Slot 1"):
		Next(2)
		Global.last_answer = 1
	if reponse == -1 and Input.is_action_just_pressed("Slot 2"):
		Next(1)
		Global.last_answer = 2

func Next1() -> void:
	Next(2)
	Global.last_answer = 1


func Next2() -> void:
	Next(1)
	Global.last_answer = 2
