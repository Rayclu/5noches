extends CanvasLayer
@onready var label: Label = get_node("LineEdit/Label")
@onready var label_2: Label = get_node("LineEdit/Label2")
@onready var Inputer = get_node("LineEdit")
var RefObj

func _ready():
	Inputer.connect("text_submitted", Callable(self, "_on_text_submitted"))
	label.hide()

func _process(delta: float) -> void:
	if RefObj:
		label_2.hide()
		label.show()
	else:
		label.hide()
		label_2.show()

func _on_text_submitted(text):
	if RefObj:
		if RefObj.stock - int(text) >= 0:
			RefObj.stock -= int(text)
		else:
			label.show()

func getObject(object):
	RefObj = object
