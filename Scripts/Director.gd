extends Node

var playerIsSelectingCards = true
var table_node
var phrIt = 0
var posible_phrases = [
	["","hola","prueba","unasdasdasdasdasdo"],
	["","","",""],
	["","","",""],
	["","","",""],
	["","","",""],
	["","","",""],
	["","","",""],
	["","","",""],
	["","","",""],
	["","","",""],
]
# Called when the node enters the scene tree for the first time.
func _ready():
	#select la frase
	table_node = get_node("Table")
	
	#mostrar la frase inncompleta y la cara del rey
	table_node.setCardsTexts(posible_phrases[phrIt])
	
	#mostrar las cartas-opciones para completar
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func checkCards():
	
	
	pass
	
func checkScore():
	
	
	pass
	
func modifyKingState():
	
	
	pass
	
func play():
	
	while playerIsSelectingCards:
		checkCards()
		if false:
			checkScore()
			modifyKingState()
			pass
	
	
	pass
