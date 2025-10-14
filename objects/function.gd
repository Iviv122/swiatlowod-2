extends Resource
class_name Component 

@export var Name : String 
@export var desc : String 

@export var max_connections : int
@export var sprite : Texture2D

signal triggered()

func on_place() -> void:
    pass

func on_connect() -> void:
    pass 

func on_appear() -> void:
    pass

func on_item_trigger() -> void:
    pass

func on_turn_end() -> void:
    pass 