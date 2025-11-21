extends CanvasLayer
@onready var LabelLimitStock = get_node("LineEdit/LimitStock")
@onready var LabelProductDrag = get_node("LineEdit/ProductDrag")
@onready var Inputer = get_node("LineEdit")
@onready var texture_rect: TextureRect = get_node("TextureRect")
@onready var LabelLimitArray = get_node("LimitArray")
@onready var finished_button = get_node("FinishedButton")
@export var LIST_OF_ELEMENTS_SELECTEDS = []
@onready var ClientListRequeriments = CLIENT.requeriments 
@onready var canExitInv = get_node("CanExitInv?")
@onready var exitSprite = get_node("ExitSprite")

var RefObj

func _ready():
	Inputer.connect("text_submitted", Callable(self, "_on_text_submitted"))
	Inputer.connect("text_changed", Callable(self, "_on_text_changed"))
	finished_button.connect("pressed",Callable(self, "FinishInv"))
	_load_background()
	LabelLimitStock.hide()
	LabelLimitArray.hide()
	canExitInv.hide()
	finished_button.hide()
	for child in HUD.get_children():
		child.hide()


func _process(delta): #utilizo process para poder cambiar en timepo real la visualizacion de los labels para cada caso
	if len(LIST_OF_ELEMENTS_SELECTEDS)==6 && !isRefInListOfSelecteds():
			LabelLimitStock.hide()
			LabelLimitArray.show()
			LabelProductDrag.hide()
			return
	if RefObj:
		LabelLimitArray.hide()
		LabelProductDrag.hide()
		LabelLimitStock.show()
	else:
		LabelLimitStock.hide()
		LabelProductDrag.show()
		LabelLimitArray.hide()
	if len(LIST_OF_ELEMENTS_SELECTEDS)!=0:
		finished_button.show()
	else:
		finished_button.hide()

func _load_background(): #funcionq ue carga el fondo cuando se abre el inv
	if SHORCUTS.image:
		var tex = ImageTexture.create_from_image(SHORCUTS.image)
		texture_rect.texture = tex

func _on_text_changed(new_text): #funcion que se ejecuta cuando el texto del LineEdit se cambia. utilizada para verificar que los caracteres sean solo numeros
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
		if len(new_text) > 1:
			Inputer.text = numbers.reverse()

func _on_text_submitted(text): #funcion conectada a la accion de enviar el LineEdit. utilizada para verificar si no se envia vacio o si el stock es suficiente
	if text == "":
		return
	if RefObj:
		if RefObj.stock - int(text) >= 0:
			AddElementsToArray(text)
		else:
			LabelLimitStock.show()

func getObject(object):#funcion utilizada en nodos hijo para modificar el valor que posee la referencia(cuanmdo un elemento es puesto en el panel)
	RefObj = object

func AddElementsToArray(CuantityStockUsed):#choclazo que me permite añadir elementos a la lsita que luego será exportada hacia el cliente
	if len(LIST_OF_ELEMENTS_SELECTEDS)==6 && !isRefInListOfSelecteds():
		return
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
	RefObj.stock -= int(CuantityStockUsed)
	#for element in LIST_OF_ELEMENTS_SELECTEDS:
	#	print(element["name"]," ",element["CuSelect"])
	#print(LIST_OF_ELEMENTS_SELECTEDS)

func is_string(char): #funcion utilizada en LineEdit para filtrar en timepo real las letras
	var abc = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ"
	for letter in abc:
		if letter == char:
			return true
	return false

func is_number(char):#funcion utilizada en LineEdit para filtrar en timepo real los numeros
	var numbers = ["1","2","3","4","5","6","7","8","9","0"]
	for number in numbers:
		if number == char:
			return true
	return false

func isRefInListOfSelecteds(): #funcion para verificar que el objeto en panel no este en la lsita seleccionado
	for Element in LIST_OF_ELEMENTS_SELECTEDS:
		if RefObj:
			if Element["ref"] == RefObj:
				return true
		else:
			return false
	return false

func FinishInv():#funcion quwe se encarga de verificar si el inventario añadido por el usuario es igual al inventario requerido por el cliente.
	if canExitInv.visible:
		return
	prints(ClientListRequeriments,LIST_OF_ELEMENTS_SELECTEDS)
	var ok = ClientListRequeriments.all(func(req):
		return LIST_OF_ELEMENTS_SELECTEDS.any(func(sel):
			return  req.name == sel["name"] and req.image == sel["ref"].image and req.stock == sel["CuSelect"]))
	if ok:
		var texture = TextureRect.new()
		texture.texture = load("res://assets/massa.jpeg")
		add_child(texture)
		for child in HUD.get_children():
			child.show()
	else:
		canExitInv.show()
		await get_tree().create_timer(2).timeout
		canExitInv.hide()
