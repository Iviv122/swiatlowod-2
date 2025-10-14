extends Label
class_name ConnectionLabel

func _ready():

	global_position += Vector2.UP*50
	global_position += Vector2.LEFT*size.x/2

	horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vertical_alignment = VERTICAL_ALIGNMENT_CENTER

func setup(c : ComponentInstance):
	text =  "0/"+str(c.component.max_connections)
	c.updated.connect(update)


func update(c : ComponentInstance):
	text =  str(c.neighbours.size())+"/"+str(c.component.max_connections)
	pass	
