extends CanvasLayer
@onready var label: Label = get_node("LineEdit/LimitStock")
@onready var label_2: Label = get_node("LineEdit/ProductDrag")
@onready var Inputer = get_node("LineEdit")
@onready var texture_rect: TextureRect = get_node("TextureRect")
@export var LIST_OF_ELEMENTS_SELECTEDS = []
var RefObj

func _ready():
	Inputer.connect("text_submitted", Callable(self, "_on_text_submitted"))
	Inputer.connect("text_changed", Callable(self, "_on_text_changed"))
	_load_background()
	label.hide()

func _process(delta: float) -> void:
	if RefObj:
		label_2.hide()
		label.show()
	else:
		label.hide()
		label_2.show()

func _load_background():
	if SHORCUTS.image:
		var tex = ImageTexture.create_from_image(SHORCUTS.image)
		texture_rect.texture = tex


func _on_text_changed(new_text: String) -> void:
	if len(new_text) == 1 && int(new_text) == 0:
			Inputer.text = ""
			return
	if !RefObj:
		Inputer.text = ""
	else:
		
		var numbers = ""
		for char in new_text:
			if !is_string(char):
				if is_number(char):
					numbers+=char
		Inputer.text = numbers
		if len(new_text) >1:
			Inputer.text = numbers.reverse()

func _on_text_submitted(text):
	if RefObj:
		if RefObj.stock - int(text) >= 0:
			RefObj.stock -= int(text)
			AddElementsToArray(text)
		else:
			label.show()

func getObject(object):
	RefObj = object

func AddElementsToArray(CuantityStockUsed):
	CuantityStockUsed = int(CuantityStockUsed)
	var cantidadCicle = 0
	if len(LIST_OF_ELEMENTS_SELECTEDS) == 0:
		LIST_OF_ELEMENTS_SELECTEDS.push_back({"name":RefObj.name,"ref":RefObj,"CuSelect":CuantityStockUsed,"totalPrice":int(CuantityStockUsed)*RefObj.value,"img":RefObj.image})
	else:
		for element in LIST_OF_ELEMENTS_SELECTEDS:
			cantidadCicle+=1
			if element["ref"] == RefObj:
				cantidadCicle-=1
				element["CuSelect"] += CuantityStockUsed
				element["totalPrice"] = int(element["CuSelect"]) * RefObj.value
		if len(LIST_OF_ELEMENTS_SELECTEDS) == cantidadCicle:
			LIST_OF_ELEMENTS_SELECTEDS.push_back({"name":RefObj.name,"ref":RefObj,"CuSelect":CuantityStockUsed,"totalPrice":int(CuantityStockUsed)*RefObj.value,"img":RefObj.image})
	for element in LIST_OF_ELEMENTS_SELECTEDS:
		print(element["name"]," ",element["CuSelect"])
	print(LIST_OF_ELEMENTS_SELECTEDS)

func is_string(char):
	var abc = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ"
	for letter in abc:
		if letter == char:
			return true
	return false

func is_number(char):
	var numbers = ["1","2","3","4","5","6","7","8","9","0"]
	for number in numbers:
		if number == char:
			return true
	return false
