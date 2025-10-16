extends Button
class_name FunctionSelect

@export var res : ComponentStash 
@export var mouse : Mouse 

func _ready():
	if res:
		setup(res)

func setup(_res : ComponentStash):
	res = _res
	icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
	icon = res.comp.sprite 

	res.used.connect(update)
	res.ended.connect(update)
	update()

func update():
	if res.amount == 0:
		queue_free()
	text = str(res.amount)

func _pressed() -> void:
	mouse.set_component(res)
