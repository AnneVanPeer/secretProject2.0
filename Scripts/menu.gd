extends NinePatchRect

# Declare member variables here.
var menu = false
var isOpen = false

var calcedex = false
var calcemon = false
var bag = false
var calcegear = false
var player = false
var save = false
var options = false
var exit = false

var specialMenu = false

signal menuIsOpen
signal menuIsClosed

var currentLabel = 0
var labels
var pointer


var calcedexNode = load("res://Scenes/Menu Scenes/Calcedex.tscn").instance()
var calcemonNode = load("res://Scenes/Menu Scenes/Calcemon.tscn").instance()
var bagNode = load("res://Scenes/Menu Scenes/Bag.tscn").instance()
var calcegearNode = load("res://Scenes/Menu Scenes/Calcegear.tscn").instance()
var playerNode = load("res://Scenes/Menu Scenes/Player.tscn").instance()
var saveNode = load("res://Scenes/Menu Scenes/Save.tscn").instance()
var optionsNode = load("res://Scenes/Menu Scenes/Options.tscn").instance()
var exitNode = load("res://Scenes/Menu Scenes/Exit.tscn").instance()


# Constructor.
func _ready():
	visible = false
	labels = get_node("Labels").get_children()
	pointer = get_node("Arrow")

	
#Deze zorgt ervoor dat de positie van het menu pijltje update.
func pointer_update():
	pointer.set_global_position(Vector2(get_global_position().x+10, labels[currentLabel].get_global_position().y))
#Deze functie zorgt voor interactie binne het menu.
func handle_interaction():
	if currentLabel == 0:
		calcedex = true
		print(calcedex)
	elif currentLabel == 1:
		calcemon = true
		print(calcemon)

# Onderstaand wordt elke frame aangeroepen
func _process(delta):
	#Deze opent het menu met een tab press.
	if Input.is_action_just_pressed("ui_menu") && isOpen == false: 
	
			menu = true
			visible = true
			isOpen = true
			emit_signal("menuIsOpen")
		
	#Deze closed het menu met een tab press.
	elif Input.is_action_just_pressed("ui_menu") && isOpen == true && specialMenu == false:
		
		menu = false
		visible = false
		isOpen = false
		emit_signal("menuIsClosed")
	
	#Deze kijkt of het menu open is, zo ja, 
	#dan kun je met de up&down arrow keys door het menu heen scrollen
		
	if Input.is_action_just_pressed("ui_up") && not specialMenu:
		
		if currentLabel == 0:
			
			currentLabel = labels.size()-1
			
		else:
			currentLabel-=1
			
		pointer_update()
		
	if Input.is_action_just_pressed("ui_down") && not specialMenu:
	
		if currentLabel == labels.size()-1:
			
			currentLabel = 0
			
		else:
			
			currentLabel+=1
			
		pointer_update()
	
	#Deze opent de desbetreffend specialMenu met enter/spatie wanneer het menu open is
	if Input.is_action_just_pressed("ui_accept") && menu == true:
		if currentLabel == 0:
			specialMenu = true
			get_tree().get_root().get_node("World").get_child(4).get_child(1).add_child(calcedexNode)
		elif currentLabel == 1:
			specialMenu = true
			get_tree().get_root().get_node("World").get_child(4).get_child(1).add_child(calcemonNode)
		elif currentLabel == 2:
			specialMenu = true
			get_tree().get_root().get_node("World").get_child(4).get_child(1).add_child(bagNode)
		elif currentLabel == 3:
			specialMenu = true
			get_tree().get_root().get_node("World").get_child(4).get_child(1).add_child(calcegearNode)
		elif currentLabel == 4:
			specialMenu = true
			get_tree().get_root().get_node("World").get_child(4).get_child(1).add_child(playerNode)
		elif currentLabel == 5:
			specialMenu = true
			get_tree().get_root().get_node("World").get_child(4).get_child(1).add_child(saveNode)
		elif currentLabel == 6:
			specialMenu = true
			get_tree().get_root().get_node("World").get_child(4).get_child(1).add_child(optionsNode)
		elif currentLabel == 7:
			specialMenu = true
			get_tree().get_root().get_node("World").get_child(4).get_child(1).add_child(exitNode)
			
	#Deze closed de special menu's op backspace
	if Input.is_action_just_pressed("ui_back") && menu == true:
		if currentLabel == 0:
			specialMenu = false
			get_tree().get_root().get_node("World").get_child(4).get_child(1).remove_child(calcedexNode)
		elif currentLabel == 1:
			specialMenu = false
			get_tree().get_root().get_node("World").get_child(4).get_child(1).remove_child(calcemonNode)
		elif currentLabel == 2:
			specialMenu = false
			get_tree().get_root().get_node("World").get_child(4).get_child(1).remove_child(bagNode)
		elif currentLabel == 3:
			specialMenu = false
			get_tree().get_root().get_node("World").get_child(4).get_child(1).remove_child(calcegearNode)
		elif currentLabel == 4:
			specialMenu = false
			get_tree().get_root().get_node("World").get_child(4).get_child(1).remove_child(playerNode)
		elif currentLabel == 5:
			specialMenu = false
			get_tree().get_root().get_node("World").get_child(4).get_child(1).remove_child(saveNode)
		elif currentLabel == 6:
			specialMenu = false
			get_tree().get_root().get_node("World").get_child(4).get_child(1).remove_child(optionsNode)
		elif currentLabel == 7:
			specialMenu = false
			get_tree().get_root().get_node("World").get_child(4).get_child(1).remove_child(exitNode)
		#Deze zorgt voor interactie in het menu
		if Input.is_action_just_pressed("ui_accept"):
			handle_interaction()
			