extends Control
@onready var TextMoney = get_node("MoneyLabel")
@onready var SignalCam = get_node("../../CamerasHUD/BttnsContainer/MainButton")

var signalPush = 0

func _ready() -> void:
	SignalCam.pressed.connect(_money_displayed)
	var proove = get_parent().get_parent().get_node("PRUEBAS")
	

func _money_displayed():
	if signalPush==0:
		TextMoney.modulate.a = 0.0
		signalPush+=1
	else:
		signalPush-=1
		TextMoney.modulate.a = 1.0
	
func _process(delta: float) -> void:
	_update_label()
	
func _update_label():
	TextMoney.text = "💰 " + str(ECONOMY.Money)
