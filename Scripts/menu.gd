extends NinePatchRect

# Declare member variables here. Examples:
var menu = false
var isOpen = false
signal menuIsOpen
signal menuIsClosed

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _input(event):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_menu") && !isOpen:
		menu = true
		visible = true
		isOpen = !isOpen
		emit_signal("menuIsOpen")

	elif Input.is_action_just_pressed("ui_menu") && isOpen:
		menu = false
		visible = false
		isOpen = !isOpen
		emit_signal("menuIsClosed")

