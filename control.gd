extends Control
var holas = Cleptomano.new()
var holas2 = Cliente.new()
func _process(delta: float) -> void:
	holas.hola()
	holas2.hola()
	print(HUD.get_children()[0])
	HUD.get_children()[0].hide()
