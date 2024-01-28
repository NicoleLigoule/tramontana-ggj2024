extends Node


var node
var ratio
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
