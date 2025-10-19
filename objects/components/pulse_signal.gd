extends Sprite2D
class_name PulseSignal

var signal_owner : ComponentInstance
var t : Tween

var signal_texture : Texture2D = preload("res://raw_assets/connection_pulse.png")

func _ready():

	texture = signal_texture 
	centered = true

	visibility_layer = 99
	add_to_group("on_turn_start")
	t = create_tween()

func on_turn_start():
	queue_free()


func send(d : ComponentInstance):
	
	t.tween_property(self,"global_position",d.global_position,0.2).set_trans(Tween.TRANS_SINE)
	await get_tree().create_timer(0.2).timeout
	if !is_queued_for_deletion():
		d.trigger_outside(signal_owner)
		queue_free()
