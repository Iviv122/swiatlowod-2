extends Sprite2D
class_name MoneyParticle 

var score : Points 
var value : int


const money_texture = preload("res://raw_assets/sprites/money_particle.png")

func _ready():
	var t = create_tween()
	texture = money_texture
	var trans = get_canvas_transform().affine_inverse().get_origin() + score.position
	
	t.tween_property(self,"global_position",trans,0.3+randf_range(-0.05,0.05)).set_trans(Tween.TRANS_QUAD)

	await get_tree().create_timer(0.3).timeout
	score.add_points(value)
	queue_free()
