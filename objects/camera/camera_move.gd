extends Camera2D
class_name CameraMove

@export var Speed: float = 1

@export var MaxZoom: float = 1
@export var MinZoom: float = 0.4

var dir: Vector2 = Vector2(0, 0)

var dragging: bool = false
var drag_start_mouse_pos: Vector2
var drag_start_camera_pos: Vector2

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		dir.x -= 1
	if event.is_action_released("left"):
		dir.x += 1
	if event.is_action_pressed("right"):
		dir.x += 1
	if event.is_action_released("right"):
		dir.x -= 1

	if event.is_action_pressed("up"):
		dir.y -= 1
	if event.is_action_released("up"):
		dir.y += 1
	if event.is_action_pressed("down"):
		dir.y += 1
	if event.is_action_released("down"):
		dir.y -= 1

	if event.is_action_pressed("zoomin"):
		zoom.x = min(zoom.x+0.2,MaxZoom)
		zoom.y = min(zoom.y+0.2,MaxZoom)
	if event.is_action_pressed("zoomout"):
		zoom.y = max(zoom.y-0.2,MinZoom)
		zoom.x = max(zoom.x-0.2,MinZoom)



	if event is InputEventMouseButton:
		var mouse_event := event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_MIDDLE:
			if mouse_event.pressed:
				dragging = true
				drag_start_mouse_pos = get_viewport().get_mouse_position()
				drag_start_camera_pos = position
			else:
				dragging = false

func _process(delta: float) -> void:
	if GameStateInstance.state != GameState.State.Playing: 
		return

	position += dir * Speed * delta/zoom

	if dragging:
		var current_mouse_pos = get_viewport().get_mouse_position()
		var off = (drag_start_mouse_pos - current_mouse_pos) * zoom
		position = drag_start_camera_pos + (off/zoom) 

	var half_viewport = get_viewport_rect().size / 2 * zoom
	position.x = clamp(position.x, limit_left + half_viewport.x, limit_right - half_viewport.x)
	position.y = clamp(position.y, limit_top + half_viewport.y, limit_bottom - half_viewport.y)
