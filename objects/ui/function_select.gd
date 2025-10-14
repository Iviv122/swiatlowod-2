extends Button
class_name FunctionSelect

@export var res : Component
@export var mouse : Mouse

func _ready():
	icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
	icon = res.sprite

func _pressed() -> void:
	mouse.set_component(res)
