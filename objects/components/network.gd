class_name Network

var size = 0

var nodes : Array[ComponentInstance]

func add(comp : ComponentInstance):
	nodes.append(comp)
	comp.network = self
	size += 1

func trigger_all() ->void:
	for i in nodes:
		i.trigger()

func unite(another :ComponentInstance):
	if another.network == self:
		return

	size += another.network.size

	for i in another.network.nodes:
		i.network = self
		nodes.append(i)
	
	print(size)
