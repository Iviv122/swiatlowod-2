extends Label 
class_name TurnTimer

var time = 0
var stop = true

@export var tick_sound : AudioStream

func _ready() -> void:
	add_to_group("on_turn_end")
	add_to_group("on_turn_start")
	on_turn_start()

func on_turn_start():
	hide()
	stop = true

func on_turn_end():
	show()
	stop = false
	time = GameProgressionInstance.turn_length
	tick()

func tick() -> void:
	if stop:
		return

	time -=1	
	text = str(int(time))
	AudioPlayerInstance.urgent_play(tick_sound)
	await get_tree().create_timer(1).timeout
	tick()

