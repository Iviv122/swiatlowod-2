extends Node
class_name MoneyParticleSpawner

signal requested(p : Vector2, v : int)

func spawn(l : Points,p : Vector2, value : int):
	var par = MoneyParticle.new()
	par.global_position = p 
	par.value =value
	par.score = l
	get_tree().root.add_child(par)

func spawn_particle(pos : Vector2,value : int) ->void:
	requested.emit(pos,value)

	
