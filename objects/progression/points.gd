extends Label
class_name Points

var points : int
var req : int = 1

func _ready():
	points = 0
	text = '0'
	GameProgressionInstance.points_label = self
	MoneyParticleSpawnerInstance.requested.connect(spawn)
	set_requirement(1)

func spawn(p : Vector2, value : int):
	MoneyParticleSpawnerInstance.spawn(self,p,value)

func add_points(a: int):
	points += a
	text = str(points) + "/" + str(req)

func set_requirement(a : int):
	points = 0
	req = a
	text = "0/"+str(a) 
