extends StaticBody2D
class_name ComponentInstance

@export var component: Component
@export var sprite: Sprite2D
@export var selection_circle: SelectionCircle
@export var trigger_sound : AudioStream

var triggeted_pop_text : PersistentPopText 

var network : Network 

var text_above: Label

var neighbours: Array[ComponentInstance]
var wires: Array[Wire]

signal updated(c : Component)

func connect_neighbour(neighbour: ComponentInstance,wire : Wire) -> void:
	neighbours.append(neighbour)
	updated.emit(self)
	component.on_connect(neighbour,self)
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
	trigger_sfx()
	component.trigger(neighbours,self,self)

func switch() -> void:
	component.switch(neighbours,self)

func trigger_sfx() -> void:
	if t:
		t.kill()
	t = create_tween()
	t.tween_property(self,"scale",Vector2(1.2,1.2),0.1).set_trans(Tween.TRANS_SPRING)
	t.tween_property(self,"scale",Vector2(1,1),0.1).set_delay(0.05).set_trans(Tween.TRANS_SPRING)
	AudioPlayerInstance.play(trigger_sound)
	triggeted_pop_text.shoot()

func trigger_outside(signal_owner : ComponentInstance):
	trigger_sfx()	
	
	component.trigger(neighbours,self,signal_owner)

func send_pulse(i : int) -> void:
	wires[i].play_effect(self,neighbours[i])

func _ready() -> void:
	text_above = ConnectionLabel.new()
	text_above.setup(self)
	text_above.global_position += global_position

	add_to_group("on_turn_end")
	add_to_group("on_turn_start")

	if !network:
		network = Network.new()
		network.add(self)

	triggeted_pop_text = PersistentPopText.new()
	triggeted_pop_text.global_position = global_position
	triggeted_pop_text.text = "triggered"
	triggeted_pop_text.label_settings = LabelSettings.new()
	triggeted_pop_text.label_settings.font_color = Color.GREEN 

	get_tree().root.add_child(triggeted_pop_text)
	get_tree().root.add_child(text_above)

func set_component(comp: Component):
	component = comp.duplicate()
	sprite.texture = comp.sprite
	component.on_place(self)
