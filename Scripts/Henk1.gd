extends "res://Scripts/npcTemplate.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_player_interaction(object_name):
	if object_name == self.name:
		print("Hier komt de tekst van Henk1")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass