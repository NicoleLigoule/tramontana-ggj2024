extends MeshInstance2D

var mesh_instance
# Called when the node enters the scene tree for the first time.
func _ready():	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var transform = self.transform # get the current transform
	# modify the transform
	transform.origin.x += 1  # move the mesh instance to the right by 1 unit per second
	transform.origin.y += 1  # move the mesh instance up by 1 unit per second

	# apply the new transform
	self.transform = transform
	pass
