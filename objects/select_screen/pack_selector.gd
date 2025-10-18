extends HBoxContainer
class_name PackSelector

@export var pack_list : ComponentPackList
@export var option_display : OptionDisplay


func _ready():
    GameStateInstance.state_change.connect(add)

func append_select():
    var sel = SelectPack.new()
    var sel1 = SelectPack.new()
   
    var first = pack_list.component_list.pick_random()
    var second = pack_list.component_list.pick_random()

    while second == first:
        second = pack_list.component_list.pick_random()

    sel.set_pack(first)
    sel1.set_pack(second)

    sel.option_display = option_display
    sel1.option_display = option_display

    add_child(sel) 
    add_child(sel1)


func add(s :GameState.State):
    if GameState.State.Selecting != s:
        return

    for i in get_children():
        i.queue_free()

    append_select()