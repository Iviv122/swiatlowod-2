extends Button
class_name SelectPack

var my_pack : ComponentPack
var option_display : OptionDisplay

func set_pack(pack : ComponentPack) -> void:
	my_pack = pack
	for i in my_pack.components:
		text += str(i.amount) + " " + i.comp.Name + "\n"

	tooltip_text = my_pack.to_string()

func _pressed() -> void:
	GameStateInstance.change_state(GameState.State.Playing)
	for i in my_pack.components:
		option_display.add_option(i)
