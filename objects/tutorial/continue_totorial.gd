extends Button
class_name ContinueTutorial

@export var tut : Tutorial

func _pressed() -> void:
    tut.load_next()