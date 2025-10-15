extends Button
class_name CameraReturnToOrigin

@export var cam : CameraMove 
var tween : Tween

func _pressed() -> void:
	if tween:
		tween.kill()

	tween = create_tween()
	tween.tween_property(cam,"global_position",Vector2(0,0),0.3).set_trans(Tween.TRANS_SINE)
