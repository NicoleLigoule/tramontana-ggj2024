extends Node

var node
var ratio
var mood : int = 7 #esto tiene que setearse solo por los puntos del juego  #hardcoding
var angry_face: MeshInstance2D
var happy_face: MeshInstance2D
var slight_smile : RichTextLabel
var smile : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	node = get_node("Speech_system/RichTextLabel")
	node.visible_ratio = 0
	ratio = self.get_meta("ratio_visible_text")
	
	angry_face = $angry_face
	happy_face = $happy_face
	slight_smile = get_node("slight_smile")
	smile = get_node("smile")

	
	if slight_smile == null:
		print("Error: Nodo confused_label no encontrado.")
	if smile == null:
		print("Error: Nodo smile_label no encontrado.")
	update_mood_visuals()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	node.visible_ratio += ratio*delta
	pass

func update_mood_visuals() -> void:
	var image_path : String = "res://Assets/Visuals/edited_MARCO_REY_PARTIDA-"
	if mood <= 3:
		angry_face.texture = load(image_path + "NEGACIÓN.png")
		happy_face.hide()
		if slight_smile != null:
			slight_smile.hide()
		if smile != null:
			smile.hide()
	elif mood <= 6:
		happy_face.texture = load(image_path + "APROBACIÓN.png")
		angry_face.hide()
		if slight_smile != null:
			slight_smile.show()
		if smile != null:
			smile.hide()
	elif  mood <= 10:
		happy_face.texture = load(image_path + "APROBACIÓN.png")
		angry_face.hide()
		if slight_smile != null:
			slight_smile.hide()
		if smile != null:
			smile.show()

func set_mood(new_mood : int) -> void:
	mood = clamp(new_mood, 1, 10)
	print("Mood actualizado a:", mood)

func get_mood() -> int:
	return mood
	

func mood_determinate(mood_param) -> int:
	while true:
		if mood_param <= 3:
			print("enojado")
		elif mood_param <= 6:
			print("neutral")
		elif mood_param <= 10:
			print("happy")
		else:
			print("Valor de mood fuera de rango")
	return mood_param

func _on_updateData(puntos: int) -> void:
	# datos actualizados
	print("Datos actualizados en Mood_System:", puntos)
	pass

func setText(texto):
	node.clear()
	node.append_text('the game')
	node.visible_ratio = 0
	pass
