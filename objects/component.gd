extends StaticBody2D
class_name ComponentInstance

# replace with resource
# where resource will have function
@export var function : Component 
@export var sprite : Sprite2D

func _ready():
    sprite.texture  = function.sprite