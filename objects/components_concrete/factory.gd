extends Component
class_name Factory

func trigger(_neighbour : Array[ComponentInstance],s : ComponentInstance ) -> void:
    MoneyParticleSpawnerInstance.spawn_particle(s.global_position,1)