extends Resource
class_name ComponentPack

@export var components : Array[ComponentStash]

func _to_string() -> String:
    var res = ""

    for i in components:
        res += str(i.amount) + " " +i.comp.Name + ":\n\n" 
        res += i.comp.to_string() 
    return res