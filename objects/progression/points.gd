extends Label
class_name Points

var points : int


func _ready():
    points = 0
    text = '0'
    MoneyParticleSpawnerInstance.requested.connect(spawn)

func spawn(p : Vector2, value : int):
    MoneyParticleSpawnerInstance.spawn(self,p,value)

func add_points(a: int):
    points += a
    text = str(points) 