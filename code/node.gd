extends Control

func _ready() -> void:
	var bttns = self.get_children()

	var x = 0
	for buttn in bttns:
		
		if x==1:
			buttn.pressed.connect(ECONOMY._add_money.bind(100))
		else:
			buttn.pressed.connect(ECONOMY._less_money.bind(100))
			x+=1
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		print(event)
		var gaga = event.keycode
		if gaga == 43 && gaga != null && event.pressed==false:
			ECONOMY._add_money(100)
		elif gaga == 45 && gaga != null && event.pressed==false:
			ECONOMY._less_money(100)
