extends Button
class_name Restart

func _pressed() -> void:
    get_tree().change_scene_to_file("res://main.tscn")