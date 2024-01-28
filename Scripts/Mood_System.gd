extends Node

var node
var ratio
var mood : int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	node = get_node("Spech_sistem/RichTextLabel")
	node.visible_ratio = 0
	ratio= self.get_meta("ratio_visible_text")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	node.visible_ratio += ratio*delta
	pass


func set_mood(new_mood : int) -> void:
	mood = clamp(new_mood, 1, 10)
	print("Mood actualizado a:", mood)


func get_mood() -> int:
	return mood
	
