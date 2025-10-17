extends Sprite2D 
class_name Mouse 

var last_function_selecter : FunctionSelect 
var current_component : ComponentStash 
var is_colliding : bool

@export var component_prefab : PackedScene
@export var check_radius : float = 0.1 
@export var placing_check_radius : float = 90 

var current_state : MouseState = MouseState.Idle

var result

var current_wire : WireProvider 

func _ready():
	current_state = MouseState.Idle
	move(global_position)

func set_component(comp : ComponentStash):
	current_component = comp 
	texture = comp.comp.sprite
func clear():
	current_component = null
	texture = null

func move(pos : Vector2):
	global_position = pos
	collision_check()

	handle_state()

	if current_state == MouseState.CantPlace:
		self_modulate = Color(1,0.5,0.5,0.5)
	else:
		self_modulate = Color(1,1,1,0.5)

func collision_check():
	var space_state = get_world_2d().direct_space_state

	var circle_shape = CircleShape2D.new()
	circle_shape.radius = current_component!=null if placing_check_radius else float(check_radius)

	transform.origin = global_position 

	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = circle_shape
	query.transform = transform
	query.collide_with_areas = true 

	result = space_state.intersect_shape(query) 

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


func place() ->void:
	if !current_component:
		return
	var m : ComponentInstance = component_prefab.instantiate()
	
	m.set_component(current_component.comp)
	m.global_position = global_position

	current_component.pull()

	if current_component.amount == 0:
		clear()

	get_tree().root.add_child(m)

func start_wire():
	if current_wire:
		if result[0].collider != current_wire.start:
			if !current_wire.check_if_connected(result[0].collider):
				if result[0].collider.have_space(): 
					current_wire.set_end(result[0].collider)
					current_wire = null
				else:
					PopTextCreatorInstance.pop_text(result[0].collider.global_position,"no connection slots",Color.RED)
					current_wire.give_error()
			else:
				PopTextCreatorInstance.pop_text(result[0].collider.global_position,"already connected",Color.RED)
				current_wire.give_error()
	else:
		if !current_wire:
			if result[0].collider.have_space():
				current_wire = WireProvider.new()

				current_wire.mouse = self
				current_wire.global_position = result[0].collider.global_position 
				current_wire.set_start(result[0].collider)
				
				get_tree().root.add_child(current_wire)
			else:
				PopTextCreatorInstance.pop_text(result[0].collider.global_position,"no connection slots",Color.RED)

func stop_wiring():
	if current_wire:
		current_wire.queue_free()
		current_wire = null	

func cancel():
	stop_wiring()
	if current_state == MouseState.Placing || current_state == MouseState.CantPlace:
		clear()

func _unhandled_input(event: InputEvent) -> void:

	if event is InputEventMouseMotion:
		move(get_global_mouse_position())
	if event.is_action_pressed("place"):
		move(get_global_mouse_position())
		if current_state == MouseState.Placing:
			place()
		elif current_state == MouseState.Wiring:
			start_wire()
		elif current_state == MouseState.Idle:
			pass
		else:
			PopTextCreatorInstance.pop_text(get_global_mouse_position(),"no space",Color.RED)
		move(get_global_mouse_position())
	if event.is_action("cancel"):
		cancel()


enum MouseState{
	Idle,
	Placing,
	CantPlace,
	Wiring,

}
