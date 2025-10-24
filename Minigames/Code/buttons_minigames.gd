extends Control

var points = 100
var ChosedButton:Button = null

func _ready() -> void: 
	ConfigBttns()
	CreateTimer(1.5,false,chooseRandomBtton)

func _process(delta: float) -> void:
	get_node("Label").text = 'points: ' + str(points)

func ConfigBttns():
	var counter = 0
	var screen = get_viewport().get_visible_rect().size
	var centro = Vector2(screen.x/2.1, screen.y/2.2)
	var radio = 200
	
	var bttns = GetButtns()
	
	for bttn in bttns:
		bttn.size = Vector2(100,100)
		var angulo = deg_to_rad(60 * counter) 
		var offset = Vector2(cos(angulo), sin(angulo)) * radio
		bttn.position = centro + offset - bttn.size / 2
		counter+=1
		if not bttn.pressed.is_connected(bttnPressed):
			bttn.pressed.connect(bttnPressed.bind(bttn))

func chooseRandomBtton():
	randomize()
	if ChosedButton:
		deletePreset(ChosedButton)
	var BttnsRandom = GetButtns().pick_random()
	
	var sombra = StyleBoxFlat.new()
	sombra.shadow_color = Color(1,0,0)
	sombra.shadow_size = 15
	BttnsRandom.add_theme_stylebox_override("normal", sombra)
	BttnsRandom.add_theme_stylebox_override("hover", sombra)
	
	ChosedButton = BttnsRandom
	CreateTimer(0.75,true,deletePreset.bind(BttnsRandom))	

func bttnPressed(ButtonPresed:Button):
	if ButtonPresed == ChosedButton:
		deletePreset(ButtonPresed)
		points +=1
	elif ButtonPresed != ChosedButton:
		points = max(0,points - 1)

func deletePreset(button:Button):
	button.remove_theme_stylebox_override("normal")
	button.remove_theme_stylebox_override("hover")
	ChosedButton = null

func GetButtns():
	var buttons:Array = []
	for object in get_children():
		if object is Button:
			buttons.append(object)
	return buttons

func CreateTimer(Wait_time:float,OneShot:bool,ConectSignal):
	var timer = Timer.new()
	timer.wait_time = Wait_time
	timer.one_shot = OneShot
	add_child(timer)
	timer.start()
	timer.timeout.connect(ConectSignal)
