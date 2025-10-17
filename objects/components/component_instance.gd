extends StaticBody2D
class_name ComponentInstance

@export var component: Component
@export var sprite: Sprite2D
@export var selection_circle: SelectionCircle

var text_above: Label

var neighbours: Array[ComponentInstance]
var wires: Array[Wire]

signal updated(c : Component)

func connect_neighbour(neighbour: ComponentInstance,wire : Wire) -> void:
	neighbours.append(neighbour)
	updated.emit(self)
	component.on_connect(neighbour)
	wires.append(wire)
	PopTextCreatorInstance.pop_text(global_position,"connected",Color.GREEN)

func _mouse_enter() -> void:
	selection_circle.appear()

func _mouse_exit() -> void:
	selection_circle.disappear()

func have_space() -> bool:
	return neighbours.size() != component.max_connections

func has_neighbour(a: ComponentInstance) -> bool:
	return neighbours.has(a)

func on_turn_start() -> void:
	component.on_turn_start(self)

func on_turn_end() -> void:
	component.on_turn_end(neighbours,self)

var t : Tween
func trigger() -> void:
	if t:
		t.kill()
	t = create_tween()
	
	t.tween_property(self,"scale",Vector2(1.2,1.2),0.1).set_trans(Tween.TRANS_SPRING)
	t.tween_property(self,"scale",Vector2(1,1),0.1).set_delay(0.05).set_trans(Tween.TRANS_SPRING)

	component.trigger(neighbours,self)

func send_pulse(i : int) -> void:
	wires[i].play_effect(self,neighbours[i])

func _ready() -> void:
	text_above = ConnectionLabel.new()
	text_above.setup(self)

	add_to_group("on_turn_end")
	add_to_group("on_turn_start")
	add_child(text_above)

func set_component(comp: Component):
	component = comp.duplicate()
	sprite.texture = comp.sprite
	component.on_place()
