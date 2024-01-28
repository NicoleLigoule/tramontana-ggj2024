extends Node

var card1
var card2
var card3
const button_pos1 = 0
const button_pos2 = 0
const button_pos3 = 0






# Called when the node enters the scene tree for the first time.
func _ready():
	card1 = get_node("Carta/Card")
	card2 = get_node("Carta2/Card2")
	card3 = get_node("Carta3/Card3")
	
	pass # Replace with function body.


func setCardsTexts(textsArr):
	card1.text = textsArr[1]
	card2.text = textsArr[2]
	card3.text = textsArr[3]
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

