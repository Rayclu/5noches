extends CanvasLayer
signal turnOffLights

var enemy_scene = preload("res://code/enemies_scene.gd")
@onready var textures = $TextureRectnew
@onready var textura2 = load("res://assets/LightsOut.png")
@onready var main = preload("res://scenes/game.tscn")
func _ready() -> void:
	# Conectar a las señales 'turnOffLights' de los enemigos instanciados en la escena actual
	if get_tree().current_scene and get_tree().current_scene.has_node("enemies"):
		var enemies_node = get_tree().current_scene.get_node("enemies")
		for enemy in enemies_node.get_children():
			if enemy.has_signal("turnOffLights"):
				enemy.connect("turnOffLights", Callable(self, "_on_turn_off_lights"))
	else:
		print("hud_tunrOffLights: nodo 'enemies' no encontrado en la escena actual")
	
func _on_turn_off_lights() -> void:
	print("Señal recibida")
	$TextureRect.texture = textura2
