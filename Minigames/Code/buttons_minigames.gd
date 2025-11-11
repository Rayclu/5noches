extends Control
var escene = load("res://scenes/game.tscn")
var points = 0
var ChosedButton:Button = null
var GameTimer:Timer = null
var ProgrssBar:ProgressBar =  null 

func _ready() -> void: 
	ProgrssBar = get_node("ProgressBar")
	GameTimer = CreateTimer(60,true,FinishGame,true)
	CreateTimer(1.5,false,chooseRandomBtton)
	ProgrssBar.value = GameTimer.time_left
	ProgrssBar.max_value = 60
	ConfigBttns()

func _process(delta: float) -> void:
	get_node("Label").text = 'points: ' + str(points)
	var timers = 0
	for nodes in get_children():
		if nodes is Timer:
			timers+=1
		if timers==4 && get_child(get_child_count()-2) is Timer:
			remove_child(get_child(get_child_count()-2))
			timers = 0
	if GameTimer:
		ProgrssBar.value = GameTimer.time_left

func ConfigBttns():
	var counter = 0
	var screen = get_viewport().get_visible_rect().size
	var centro = Vector2(screen.x/2.0, screen.y/2.)
	var radio = 200
	ProgrssBar.position = Vector2(screen.x/2.5,0)
	var bttns = GetButtns()
	
	for bttn in bttns:
		bttn.get_child(0).size = Vector2(100,100)
		bttn.size = Vector2(100,100)
		var angulo = deg_to_rad(60 * counter) 
		var offset = Vector2(cos(angulo), sin(angulo)) * radio
		bttn.position = centro + offset - bttn.size / 2
		counter+=1
		if not bttn.pressed.is_connected(bttnPressed):
			bttn.pressed.connect(bttnPressed.bind(bttn))
		var estilo = StyleBoxFlat.new()
		estilo.bg_color = Color(255,255,255)
		estilo.border_color = Color(0,0,0)
		estilo.border_width_bottom = 3
		estilo.border_width_left = 3
		estilo.border_width_right = 3
		estilo.border_width_top = 3
		var Hover = StyleBoxFlat.new()
		Hover.bg_color = Color(255,0,0)
		Hover.border_color = Color(0,0,0)
		Hover.border_width_bottom = 3
		Hover.border_width_left = 3
		Hover.border_width_right = 3
		Hover.border_width_top = 3
		bttn.add_theme_stylebox_override("normal", estilo)
		bttn.add_theme_stylebox_override("hover", Hover)
		bttn.add_theme_stylebox_override("pressed", Hover)

func chooseRandomBtton():
	randomize()
	if ChosedButton:
		deletePreset(ChosedButton)
	var BttnsRandom = GetButtns().pick_random()
	
	var sombra = StyleBoxFlat.new()
	sombra.bg_color = Color(0,255,0)
	sombra.shadow_color = Color(0,255,0)
	sombra.shadow_size = 20
	sombra.border_color = Color(0,0,0)
	sombra.set_border_width_all(3)

	BttnsRandom.add_theme_stylebox_override("normal", sombra)
	BttnsRandom.add_theme_stylebox_override("pressed", sombra)
	BttnsRandom.add_theme_stylebox_override("hover", sombra)
	
	ChosedButton = BttnsRandom
	CreateTimer(0.75,true,deletePreset.bind(BttnsRandom))	

func bttnPressed(ButtonPresed:Button):
	var label =get_node("Label2")
	if ButtonPresed == ChosedButton:
		deletePreset(ButtonPresed)
		label.text = "+1"
		label.visible = true
		label.position = Vector2(ButtonPresed.position.x+50,ButtonPresed.position.y -50)
		await get_tree().create_timer(0.5).timeout
		label.visible=false
		points +=1

	elif ButtonPresed != ChosedButton && points!=0:
		label.visible = true
		label.text = "-1"
		label.position = Vector2(ButtonPresed.position.x+50,ButtonPresed.position.y -50)
		await get_tree().create_timer(0.5).timeout
		label.visible=false
		points = max(0,points - 1)

func deletePreset(button:Button):
	button.remove_theme_stylebox_override("normal")
	button.remove_theme_stylebox_override("hover")
	
	var estilo = StyleBoxFlat.new()
	estilo.bg_color = Color(255,255,255)
	estilo.border_color = Color(0,0,0)
	estilo.set_border_width_all(3)
	
	var Hover = StyleBoxFlat.new()
	Hover.bg_color = Color(255,0,0)
	Hover.border_color = Color(0,0,0)
	Hover.set_border_width_all(3)
	button.add_theme_stylebox_override("normal", estilo)
	button.add_theme_stylebox_override("hover", Hover)
	button.add_theme_stylebox_override("pressed", Hover)
	ChosedButton = null

func GetButtns():
	var buttons:Array = []
	for object in get_children():
		if object is Button:
			buttons.append(object)
	return buttons

func FinishGame():
	for childs in get_children():
		if childs is not Timer:
			childs.visible = false
			
	var screen = get_viewport().get_visible_rect().size
	var label_finish = Label.new()
	label_finish.add_theme_font_size_override("font_size", 32)
	label_finish.text = '    Conseguiste ' + str(points) + " puntos! \n\n\n ¿desea salir del minijuego?"
	label_finish.position = Vector2(screen.x/3.2,screen.y/5)
	add_child(label_finish)
	var buton_confirm = Button.new()
	add_child(buton_confirm)
	buton_confirm.text = "salir"
	buton_confirm.size = Vector2(200,50)
	buton_confirm.position= Vector2(screen.x/2.5,screen.y/1.5)
	buton_confirm.pressed.connect(changeScene)

func changeScene():
	ECONOMY._add_money(points*10)
	get_tree().change_scene_to_packed(escene)

func actualizar_barra():
	var tween = create_tween()
	var hi = int(GameTimer.time_left)
	tween.tween_property(ProgrssBar, "value", hi, 0.4)

func CreateTimer(Wait_time:float,OneShot:bool,ConectSignal,returned = false):
	var timer = Timer.new()
	timer.wait_time = Wait_time
	timer.one_shot = OneShot
	add_child(timer)
	timer.start()
	timer.timeout.connect(ConectSignal)
	if returned:
		return timer
