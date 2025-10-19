class_name Network

var size = 0

var nodes : Array[ComponentInstance]

func add(comp : ComponentInstance):
	nodes.append(comp)
	size += 1
	print(size)

func trigger_all() ->void:
	for i in nodes:
		i.trigger()

func unite(another :ComponentInstance):
	size += another.network.size

	for i in another.network.nodes:
		i.network = self
		nodes.append(i)
	
	print(size)
