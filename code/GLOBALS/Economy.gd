extends Node
var Money = 0 + LEVELS.InitialMoney

func _add_money(money):
	Money+=money
	
func _less_money(money):
	if Money < money:
		return
	Money-=money

func _get_money():
	return Money
