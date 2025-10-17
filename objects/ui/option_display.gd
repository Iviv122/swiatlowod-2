extends HBoxContainer
class_name OptionDisplay

func add_option(_res : ComponentStash) -> void:
    var f = FunctionSelect.new()
    f.setup(_res)
    add_child(f)