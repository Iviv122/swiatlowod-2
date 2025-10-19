extends Panel
class_name Tutorial

@export var slides : Array[TutorialSlide]

func exit():
	queue_free()
	GameStateInstance.change_state(GameState.State.Playing)

var i = 0

func load_next():
	for c in get_children():
		c.queue_free()

	if i == slides.size():
		exit()
		return

	var center_container = CenterContainer.new()
	center_container.set_anchors_preset(Control.PRESET_FULL_RECT)

	var vBoxContainer = VBoxContainer.new()
	vBoxContainer.alignment = BoxContainer.ALIGNMENT_CENTER

	var texture_rect = TextureRect.new()
	texture_rect.texture = slides[i].image
	texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	texture_rect.custom_minimum_size = Vector2(slides[i].image.get_width(), slides[i].image.get_height())
	vBoxContainer.add_child(texture_rect)

	var text = Label.new()
	text.text = slides[i].description
	text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	text.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vBoxContainer.add_child(text)

	var button = ContinueTutorial.new()
	button.tut = self
	button.text = "continue"
	vBoxContainer.add_child(button)

	vBoxContainer.add_theme_constant_override("separation",45)

	center_container.add_child(vBoxContainer)
	add_child(center_container)

	i += 1
