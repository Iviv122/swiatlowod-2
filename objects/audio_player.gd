extends Node2D
class_name AudioPlayer

var num_players = 16
var bus = "master"

var available = []
var queue = []

var max_sound_in_queue = 40

func _ready():
	for i in num_players:
		var p = AudioStreamPlayer2D.new()
		add_child(p)
		available.append(p)
		p.finished.connect( func() : _on_stream_finished(p))
		p.bus = bus


func _on_stream_finished(stream):
	available.append(stream)


func play(sound_path):
	if queue.size() <= max_sound_in_queue:
		queue.append(sound_path)


func _process(delta):
	if not queue.is_empty() and not available.is_empty():
		available[0].stream = queue.pop_front()
		available[0].play()
		available.pop_front()
