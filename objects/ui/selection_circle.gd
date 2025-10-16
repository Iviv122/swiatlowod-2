extends Sprite2D
class_name SelectionCircle

var init_scale : Vector2

var tween

func _ready():
	init_scale = scale

func appear() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self,"scale",init_scale,0.3).set_trans(Tween.TRANS_SPRING)

func disappear() ->void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self,"scale",Vector2.ZERO,0.3).set_trans(Tween.TRANS_SPRING)


func _process(delta):
	rotation += delta