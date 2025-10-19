extends Label
class_name TurnsSurvived


func _ready():
    text = "You lasted for " + str(GameProgressionInstance.turn) + " turns"