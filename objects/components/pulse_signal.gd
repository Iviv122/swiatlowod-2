extends Sprite2D
class_name PulseSignal

func _ready():

	texture = load("res://raw_assets/connection_pulse.png")
	centered = true

	visibility_layer = 99
	add_to_group("on_turn_start")

func on_turn_start():
	queue_free()

func send(d : ComponentInstance):
	var t = create_tween()
	t.tween_property(self,"global_position",d.global_position,0.2).set_trans(Tween.TRANS_SINE)
	await get_tree().create_timer(0.2).timeout
	d.trigger()
	queue_free()
