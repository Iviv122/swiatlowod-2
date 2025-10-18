extends Component
class_name Factory

func trigger(_neighbour : Array[ComponentInstance],s : ComponentInstance,_signal_owner : ComponentInstance) -> void:
    MoneyParticleSpawnerInstance.spawn_particle(s.global_position,1)