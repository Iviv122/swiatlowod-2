extends Line2D
class_name Wire

func _ready():
    pass

func play_effect():
    var pulse_particle = Sprite2D.new()
    pulse_particle.texture = load("res://raw_assets/connection_pulse.png")
    pulse_particle.centered = true

    pulse_particle.global_position = points[0]
    pulse_particle.visibility_layer = 99

    get_tree().root.add_child(pulse_particle)
    
    var t = pulse_particle.create_tween()
    t.tween_property(pulse_particle,"global_position",points[1],0.2).set_trans(Tween.TRANS_QUAD)
    t.play()