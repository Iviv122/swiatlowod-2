extends Line2D
class_name Wire

var mouse : Mouse

var start : ComponentInstance
var finish : ComponentInstance


func set_start(comp : ComponentInstance):
	start = comp
	add_point(comp.global_position - global_position)
	add_point(mouse.global_position)

func set_end(comp : ComponentInstance):
	remove_point(1)
	finish = comp
	add_point(finish.global_position)

	var l : Line2D = Line2D.new()
	l.add_point(start.global_position)
	l.add_point(finish.global_position)

	get_tree().root.add_child(l)
	queue_free()

func are_connected():
	pass

func connect_neighbours():
	start.connect_neighbour(finish)	
	finish.connect_neighbour(start)
	
	pass

func _process(_delta):
	points[1] = mouse.global_position-global_position
