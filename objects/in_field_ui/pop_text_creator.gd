extends Node
class_name PopTextCreator

func _ready():
	add_to_group("pop_text")

func pop_text(pos: Vector2,text : String,color : Color = Color.WHITE,height : float = 50,lifetime : float =1):
	var l  = PopText.new()

	l.lifetime = lifetime
	l.height = height 
	l.global_position = pos
	l.text = text
	l.label_settings = LabelSettings.new()
	l.label_settings.font_color = color
	l.visibility_layer = 99
	
	get_tree().current_scene.add_child(l)
