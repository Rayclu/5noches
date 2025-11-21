extends Control

@onready var texture_rect = get_node("TextureRect")
@onready var animations:AnimatedSprite2D = get_node("Left")
@onready var button = get_node("Button")
@onready var ClientPanel = $Nube

signal bebe

func _ready() -> void:
	ClientPanel.hide()
	CLIENT.CreateClient()#-- crea cliente
	self.add_child(CLIENT.client) #-- lo meto de hijo apra que el tween ande(sino no me lo detecta y no hace zoom)
	#-- conecto la señal para poder tener logica desde de que se ejecutan cosas
	CLIENT.client.EnterClient.connect(Callable(self,"apearThings"))
	CLIENT.client.leftClient.connect(Callable(self,"ClientHasLeft"))
	bebe.connect(Callable(self,"leftClient"))
	#-- le seteo las animaciones
	CLIENT.client.SetAnimations(animations) 
	
	CLIENT.client.EnterShop()
	
func apearThings():
	ClientPanel.show() 

func leftClient():
	ClientPanel.hide()
	CLIENT.client.BackClient()

func ClientHasLeft():
	print("se fueee wachooo")
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		bebe.emit()
#func StoleAnimation():
#	LeftAnimation.play("Stole")
#	tween = create_tween()
#	tween.tween_property(LeftAnimation,"scale",Vector2(2,2), 5)
#	ClientPanel.hide()
