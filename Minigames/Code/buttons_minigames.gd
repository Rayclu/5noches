extends Control

var points = 100
func _ready() -> void: 
	$Button2.pressed.connect(chooseRandomBtton)
	
	ConfigBttns()

func _process(delta: float) -> void:
	get_node("Label").text = 'points: ' + str(points)
	#chooseRandomBtton()
	bttnPressed()
	
func ConfigBttns():
	
	var counter = 0
	var screen = get_viewport().get_visible_rect().size
	var centro = Vector2(screen.x/2.1, screen.y/2.2)
	var radio = 200
	var bttns = self.get_children()
	bttns.pop_back()
	for bttn in bttns:
		bttn.size = Vector2(100,100)
		var angulo = deg_to_rad(60 * counter) 
		var offset = Vector2(cos(angulo), sin(angulo)) * radio
		bttn.position = centro + offset - bttn.size / 2
		counter+=1

func chooseRandomBtton():
	randomize()
	var BttnsRandom = self.get_children()
	BttnsRandom.pop_back()
	BttnsRandom=BttnsRandom.pick_random()
	var sombra = StyleBoxFlat.new()
	sombra.shadow_color = Color(1,0,0)
	sombra.shadow_size = 15
	BttnsRandom.add_theme_stylebox_override("normal", sombra)
	BttnsRandom.add_theme_stylebox_override("hover", sombra)
	if not BttnsRandom.pressed.is_connected(deletePreset):
		BttnsRandom.pressed.connect(deletePreset.bind(BttnsRandom))
#A ARREGLAR UNA BANDA DE COSASSSS
func bttnPressed():
	var bttns = get_children()
	bttns.pop_back()
	for button in bttns:
		if button.has_theme_stylebox_override("normal") && button.toggled:
			print("HOLA")
			print(button.toggled)
			points+=1
		
func deletePreset(button):
	button.remove_theme_stylebox_override("normal")
	button.remove_theme_stylebox_override("hover")
