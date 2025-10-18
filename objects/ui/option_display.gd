extends HBoxContainer
class_name OptionDisplay

@export var mouse : Mouse

func add_option(_res : ComponentStash) -> void:
    var f = FunctionSelect.new()
    f.mouse = mouse
    f.setup(_res.duplicate_deep())
    add_child(f)