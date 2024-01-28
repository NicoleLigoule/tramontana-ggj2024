extends Node

var node
var ratio
var mood : int = 5 #esto esta seteado en 5 porque asi comienza en neutral
var angry_face: MeshInstance2D
var happy_face: MeshInstance2D
var smile : RichTextLabel
var vidas = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	node = get_node("Speech_system/RichTextLabel")
	node.visible_ratio = 0
	ratio = self.get_meta("ratio_visible_text")
	
	angry_face = $angry_face
	happy_face = $happy_face
	smile = get_node("smile")

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
		if smile != null:
			smile.hide()
	elif mood <= 6:
		happy_face.texture = load(image_path + "NEUTRAL.png")
		angry_face.hide()
		if smile != null:
			smile.hide()
	elif  mood <= 10:
		happy_face.texture = load(image_path + "APROBACIÓN.png")
		angry_face.hide()
		if smile != null:
			smile.show()

func set_mood(new_mood : int) -> void:
	mood = clamp(new_mood, 1, 10)
	print("Mood actualizado a:", mood)

func get_mood() -> int:
	return mood
	

func mood_determinate(mood_param) -> int:
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
	set_mood(mood + puntos)
	update_mood_visuals()
	# datos actualizados
	print("Datos actualizados en Mood_System:", puntos)
	pass

func setText(texto):
	node.clear()
	node.append_text(texto)
	node.visible_ratio = 0
	pass
