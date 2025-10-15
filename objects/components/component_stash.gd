extends Resource
class_name ComponentStash

@export var comp : Component
@export var amount : int

signal used()
signal ended()

func pull():
    
    amount-=1
    used.emit()
    if amount == 0:
        ended.emit()