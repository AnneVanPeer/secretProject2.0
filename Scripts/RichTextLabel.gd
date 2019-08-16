extends RichTextLabel

var dialogue = ["Hallo, dit is een piza"]
var page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_use_bbcode(true)
	set("custom_fonts", load("res://Fonts/pokemonFont.tres"))
	append_bbcode("[color=red]Hallo is dit het pokemon FONT? \n[/color]")
	append_bbcode("[color=red]Hallo is dit het pokemon FONT?[/color]")