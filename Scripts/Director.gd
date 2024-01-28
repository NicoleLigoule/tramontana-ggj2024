extends Node

var playerIsSelectingCards = true
var table_node
var timer_node
var phrIt = 0
var posible_phrases = [
	["oracion por completar _________","hola","prueba","unasdasdasdasdasdo"],
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
var current_phrase_index = 0
var player_score = 5 #hardcoding
@onready var mood_system = get_node("Mood_System")

func setTextAndProceed():
	mood_system.setText(posible_phrases[phrIt][0])
	table_node.setCardsTexts(posible_phrases[phrIt])
	phrIt += 1
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	#select la frase
	table_node = get_node("Table")
	timer_node = get_node("Timer")
	
	#mostrar las cartas-opciones para completar
	play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func checkCards():
	#if table_node.button_pressed != -1:
		#
		#print(table_node.button_pressed)
		#table_node.button_pressed = -1
		
	return table_node.getPointsForButton()	
	pass
	
	
func didPlayerLose()->bool:
	#this will check lives and will determine if we lose
	return true
	
func checkScore():
	
	
	pass
	
func updateKingState(puntos: int) -> void:
	print("Puntos obtenidos: ", puntos)
	if mood_system != null:
		mood_system._on_updateData(puntos)
		print("conexion exitosa")
	else:
		print("Error:'Mood_System' no encontrado.")
	pass

func timerRunOut():
	return timer_node.time_left > 0 and not timer_node.paused

func play():
	timer_node.start()
	while not didPlayerLose() and not timerRunOut() :
		var puntos = checkCards()
		if  puntos != 0 :
			updateKingState(puntos)
			setTextAndProceed()
			pass
	
	
	pass

func _on_PlayerCompletedPhrase():
	checkCards()
	checkScore()
	updateKingState(2) #hardcoding
