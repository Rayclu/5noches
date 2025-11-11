extends Node
@export var obs_scene : PackedScene
var game_running : bool
var game_over : bool
var screenSize: Vector2i
var groundHeight: int
var scroll
const SCROLL_SPEED = 4
var pipes: Array
const PipeDelay = 100
const PipeRnge = 200
var pipesScene = preload("res://scenes/obstaculos.tscn")

func _ready() -> void:
	screenSize = get_window().size
	groundHeight = $Ground.get_node("Sprite2D").texture.get_height()
	new_game()
func new_game():
	game_over = false
	game_running = true
	$obs_timer.start()
	
 
func _process(delta: float) -> void:
	#if  game_running:
	#	scroll += SCROLL_SPEED
	#	if scroll >= screenSize.x:
	#		scroll = 0
	#	$Ground.position.x = -scroll
		for pipe in pipes:
			pipe.position.x -= SCROLL_SPEED
	
	
func _on_obs_timer_timeout() -> void:
	generate_obs()
	
func generate_obs():
	var pipe = pipesScene.instantiate()
	pipe.position.x = screenSize.x + PipeDelay
	pipe.position.y = ( screenSize.y - groundHeight ) / 2 + randi_range( -PipeRnge , PipeRnge)
	pipe.hit.connect(player_hit)
	add_child(pipe)
	pipes.append(pipe)
	

func player_hit():
	pass
