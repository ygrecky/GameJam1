extends CanvasLayer
@onready var text = $Control/VBoxContainer/Text
@onready var speaker = $Control/VBoxContainer/Name
@onready var sprite = $Control/VBoxContainer/SpriteCharacter
@onready var state = $Control

var avancement = 0
var writing = false
var target = ""
var version = 0


func add_letter(target,avancement, vers):
	if vers == version :
		text.text += target[avancement]
		print(text.text)
		avancement += 1
		
		if avancement != target.length():
			get_tree().create_timer(0.05).timeout.connect(func() : add_letter(target,avancement + 1,vers))
		
	
func Next() -> void:
	version += 1
	text.text = ""
	add_letter("paokedonzeciisnci",0,version)
	
func open_window():
	state.show()

func close_window():
	state.hide()
	

		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state.hide()
	state = true
	
	Next()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
