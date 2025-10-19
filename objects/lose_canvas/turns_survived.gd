extends Label
class_name TurnsSurvived

func update(amount : int) -> void:
    text = "You lasted for " +  str(amount) + " turns"

func _ready():
    GameProgressionInstance.lost.connect(update)