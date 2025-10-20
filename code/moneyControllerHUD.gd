extends Control
@onready var TextMoney = get_node("MoneyLabel")
@onready var SignalCam = get_parent().get_parent().get_node("Cameras HUD/BttnsContainer/MainButton")

var signalPush = 0

func _ready() -> void:
	SignalCam.pressed.connect(_money_displayed)
	_update_label(0)
	var proove = get_parent().get_parent().get_node("Node")
	proove.connect("add_money",Callable(self, "_add_money"))
	proove.connect("spend_money",Callable(self, "_less_money"))
	

func _add_money(money):
	_animate_money_change(int(TextMoney.text) + money)
	
func _less_money(money):
	if int(TextMoney.text) < money:
		print("gaga")
	else:
		_animate_money_change(int(TextMoney.text) - money)

func _money_displayed():

	if signalPush==0:
		TextMoney.modulate.a = 0.0
		signalPush+=1
	else:
		signalPush-=1
		TextMoney.modulate.a = 1.0
	
	
func _update_label(money):
	
	TextMoney.text = "💰 " + str(money)

func _animate_money_change(target_money):
	var money = int(TextMoney.text)
	var step = 1 if target_money > money else -1
	while money != target_money:
		money += step
		TextMoney.text = "💰 " + str(money)
		await get_tree().create_timer(0.00001).timeout
