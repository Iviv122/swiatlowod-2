extends Line2D
class_name Wire

var mouse : Mouse

var start : ComponentInstance
var finish : ComponentInstance

var tween : Tween

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

	connect_neighbours()

	get_tree().root.add_child(l)
	queue_free()

func check_if_connected(another : ComponentInstance) -> bool:
	return start.has_neighbour(another)

func give_error():
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self,"default_color",Color.RED,0.1).set_trans(Tween.TRANS_SPRING)
	tween.tween_property(self,"default_color",Color.WHITE,0.1).set_delay(0.1).set_trans(Tween.TRANS_SPRING)

func connect_neighbours():
	start.connect_neighbour(finish)	
	finish.connect_neighbour(start)

func _process(_delta):
	points[1] = mouse.global_position-global_position
