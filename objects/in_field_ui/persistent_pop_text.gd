extends PopText 
class_name PersistentPopText

var tween : Tween
var orig_pos : Vector2

func _ready():
	hide()
	global_position += Vector2.LEFT*size.x/2

	horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	orig_pos = global_position

func shoot() ->void:
	show()
	global_position = orig_pos
	if tween:
		tween.kill()
	tween = create_tween()

	tween.tween_property(self,"position",position+Vector2.UP*height,0.4).set_trans(Tween.TRANS_SPRING)
	await get_tree().create_timer(lifetime).timeout
	hide()
