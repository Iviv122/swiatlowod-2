extends Label
class_name PopText

var lifetime = 2
var height = 100 

func _ready():


	var tween = create_tween()

	global_position += Vector2.LEFT*size.x/2

	horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	
	tween.tween_property(self,"position",global_position+Vector2.UP*height,1).set_trans(Tween.TRANS_SPRING)
	await get_tree().create_timer(lifetime).timeout
	queue_free()
