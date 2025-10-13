extends Resource
class_name Component 

@export var Name : String 
@export var desc : String 

@export var max_connections : int
@export var sprite : Texture2D


# on placement
func on_place() -> void:
    pass

# connect to grid
# TODO: add priority to action, trigger before on_appear for other items
func on_connect() -> void:
    pass 

# new item in grid
# TODO: add priority to actions
func on_appear() -> void:
    pass

# item in grid triggered
# TODO: add priority to actions
func on_item_trigger() -> void:
    pass