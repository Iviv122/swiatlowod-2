extends Sprite2D 
class_name Mouse 

var last_function_selecter : FunctionSelect 
var current_component : Component
var is_colliding : bool

@export var component_prefab : PackedScene
@export var check_radius : float 

var current_state : MouseState = MouseState.Idle

func _ready():
	current_state = MouseState.Idle
	move(global_position)

func set_component(comp : Component):
	current_component = comp 
	texture = comp.sprite
func clear():
	current_component = null
	texture = null

func move(pos : Vector2):
	global_position = pos
	collision_check()

	handle_state()

	if current_state == MouseState.CantPlace:
		self_modulate = Color(1,0.5,0.5,1)
	else:
		self_modulate = Color(1,1,1,1)

func collision_check():
	var space_state = get_world_2d().direct_space_state

	var circle_shape = CircleShape2D.new()
	circle_shape.radius = check_radius 

	transform.origin = global_position 

	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = circle_shape
	query.transform = transform
	query.collide_with_areas = true 

	var result = space_state.intersect_shape(query) 

	var n = result.size()

	is_colliding = n > 0


func handle_state():
	if current_component != null && is_colliding:
		current_state = MouseState.CantPlace 
	elif current_component != null && !is_colliding:
		current_state = MouseState.Placing
	elif current_component == null && is_colliding:
		current_state = MouseState.Wiring
	else:
		current_state = MouseState.Idle


func place():

	var m : ComponentInstance = component_prefab.instantiate()
	m.set_component(current_component)
	m.global_position = global_position
	get_tree().root.add_child(m)

func stop_wiring():
	pass

func cancel():
	if current_state == MouseState.Placing || current_state == MouseState.CantPlace:
		clear()
	if current_state == MouseState.Wiring:
		stop_wiring()

func _unhandled_input(event: InputEvent) -> void:

	if event is InputEventMouseMotion:
		move(event.global_position)
	if event.is_action_pressed("place"):
		if current_state == MouseState.Placing:
			place()
		elif current_state == MouseState.Wiring:
			#start_wire()
			pass
		elif current_state == MouseState.Idle:
			pass
		else:
			# play sound of incorect placing
			pass
	if event.is_action("cancel"):
		cancel()


enum MouseState{
	Idle,
	Placing,
	CantPlace,
	Wiring,

}