extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_use_bbcode(true)
	set("custom_fonts/normal_font", load("res://Fonts/pokemonFont.tres"))
	append_bbcode("[color=red]Hallo is dit het pokemon FONT? \n[/color]")
	append_bbcode("[color=red]Hallo is dit het pokemon FONT?[/color]")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
