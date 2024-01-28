extends Node

var playerIsSelectingCards = true
var table_node
var timer_node
var phrIt = 0
var posible_phrases = [
  ["Tengo un amigo otaku que estaba triste, así que lo ____", "saludé", "animé", "hablé"],
  ["Conocí a mi novia en un ascensor. Dice que soy el amor de ____.", "verano", "subida", "mentira"],
  ["¿De dónde sale la porcelana? De las ____.", "nubes", "porceovejas", "de las tazas"],
  ["¿Qué le dice un techo a otro?", "Hace años no me pintan", "Techo de menos.", "Mis tejas son mejores"],
  ["Soy asmático, ¿es grave?", "No", "No, es esdrújula", "Si"],
  ["¿Cuál es el café más peligroso del mundo?", "El de saquito", "El ex-preso", "El de polvo"],
  ["¿Para qué va una caja al gimnasio?", "Para ponerse cuadrada", "Para hacerse caja fuerte", "Por salud"],
  ["Una persona entra en un bar de pinchos y dice ____.", "Buenas noches", "¡Ay, ay, ay!", "2 brochettes por favor"],
  ["¿Qué le dice un pollito a su enemigo?", "Te daré salmonella", "¡Caldito seas!", "No comeras mi carne"],
  ["¿Cómo se llama el cartel más leído en Navidad?", "Sin alcohol", "No incluye pilas", "Amor, paz y prosperidad"],
  ["¿Qué le gusta cantar a un coro de gatos? Do - Re...", "Fa", "Miau", "Si"],
  ["¿Cuál es el desodorante favorito de los dinosaurios?", "El dove", "El rex-ona", "El axe"],
  ["¿Quién habrá cometido el crimen del banco?", "Matias Fahler", "Esteban Dido", "Nicole Ligoule"],
  ["¿Cuál es el colmo de Batman?", "Tener un gato", "Que le robin", "El bati-colmo"],
  ["¿Cuántos técnicos informáticos de Microsoft son necesarios para cambiar una lamparita?", "Tres", "Ninguno, es un problema de hardware", "Depende la altura"]
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
	timer_node.start()
	print(timer_node.time_left)
	print(timerRunOut())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func checkCards():
	return table_node.getPointsForButton()	
	pass
	
	
func didPlayerLose()->bool:
	#this will check lives and will determine if we lose
	return false
	
func updateKingState(puntos: int) -> void:
	print("Puntos obtenidos: ", puntos)
	if mood_system != null:
		mood_system._on_updateData(puntos)
		print("conexion exitosa")
	else:
		print("Error:'Mood_System' no encontrado.")
	pass

func timerRunOut():
	return not timer_node.time_left > 0 and not timer_node.paused


func _button_pressed():
	print("botton presionado")
	var puntos = checkCards()
	if  puntos != 0 :
			updateKingState(puntos)
			setTextAndProceed()
	pass # Replace with function body.
