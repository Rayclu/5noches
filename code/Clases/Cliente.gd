extends Node


class_name Cliente
var nombre
var requeriments
var asset
var tween
var animations

signal EnterClient
signal leftClient

#fiar futura implementacion
static func CreateInstance(name,listOfReq,image):
	var cliente = Cliente.new()
	cliente.nombre = name
	cliente.asset = image
	cliente.requeriments = listOfReq
	return cliente

func EnterShop():   
	animations.play("Enter")
	tween = create_tween()
	tween.tween_property(animations, "scale", Vector2(9,9), 5)
	await tween.finished
	ConfigTween()
	EnterClient.emit()

func ConfigTween():
	animations.stop()
	animations.set_frame_and_progress(4,0.0)

func BackClient():
	#se toca el boton, se emite una señal, se ------ 	ClientPanel.hide()
	animations.play("Back")
	tween = create_tween()
	tween.tween_property(animations,"scale",Vector2(2,2), 5)
	await get_tree().create_timer(0.7).timeout
	animations.sprite_frames.remove_frame("Back", 0)
	await tween.finished
	ConfigUI()
	leftClient.emit()

func ConfigUI():
	animations.stop()
	animations.hide()

func SetAnimations(coupleAnima):
	animations = coupleAnima

func comprar():
	pass
