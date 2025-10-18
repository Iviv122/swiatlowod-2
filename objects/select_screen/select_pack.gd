extends Button
class_name SelectPack

var my_pack : ComponentPack
var option_display : OptionDisplay

func set_pack(pack : ComponentPack) -> void:
	my_pack = pack
	for i in my_pack.components:
		text += i.comp.Name + "\n"

func _pressed() -> void:
	GameStateInstance.change_state(GameState.State.Playing)
	for i in my_pack.components:
		option_display.add_option(i)
