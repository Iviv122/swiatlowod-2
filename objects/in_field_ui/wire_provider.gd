extends Line2D
class_name WireProvider

var mouse: Mouse

var start: ComponentInstance
var finish: ComponentInstance

var tween: Tween

func _ready():
	texture = load("res://raw_assets/dashedline.png")
	texture_mode = Line2D.LINE_TEXTURE_TILE


	var shaderMat = ShaderMaterial.new()
	shaderMat.shader = load("res://shaders/panning.gdshader")
	material = shaderMat

func set_start(comp: ComponentInstance):
	start = comp
	add_point(comp.global_position - global_position)
	add_point(mouse.global_position)

func set_end(comp: ComponentInstance):
	remove_point(1)
	finish = comp
	add_point(finish.global_position)

	var l: Wire = Wire.new()
	l.add_point(start.global_position)
	l.add_point(finish.global_position)

	l.texture = texture.duplicate()
	l.texture_mode = Line2D.LINE_TEXTURE_TILE
	l.material = material.duplicate()
	l.z_index -= 1

	
	start.connect_neighbour(finish,l)
	finish.connect_neighbour(start,l)

	if start.network.size > finish.network.size:
		start.network.unite(finish)
	else:
		finish.network.unite(start)

	get_tree().root.add_child(l)
	queue_free()

func check_if_connected(another: ComponentInstance) -> bool:
	return start.has_neighbour(another)

func give_error():
	if tween:
		tween.kill()
	tween = create_tween()

	var shader_mat := material as ShaderMaterial

	tween.tween_method(
		func(x): shader_mat.set_shader_parameter("color", Color.RED * x),
		0, 1, 0.1
	).set_trans(Tween.TRANS_SPRING)

	tween.tween_method(
		func(x): shader_mat.set_shader_parameter("color", Color.WHITE * x),
		0, 1, 0.1
	).set_delay(0.1).set_trans(Tween.TRANS_SPRING)



func _process(_delta):
	points[1] = mouse.global_position - global_position
