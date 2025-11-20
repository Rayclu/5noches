extends Control

@onready var texture_rect = get_node("TextureRect")
@onready var EnterAnimation = get_node("Enter")
@onready var LeftAnimation:AnimatedSprite2D = get_node("Left")
@onready var button = get_node("Button")
var tween = create_tween()

func _ready() -> void:
	CLIENT.ChoseElements()
	button.connect("pressed",Callable(self,"StartAnimation"))
	EnterAnimation.play()
	LeftAnimation.hide()
	tween.tween_property(EnterAnimation, "scale", Vector2(10,10), 10)
	
func StartAnimation():
	if EnterAnimation.is_playing():
		return
	else:
		EnterAnimation.hide()
		LeftAnimation.scale = Vector2(9,9)
		LeftAnimation.show()
		LeftAnimation.play("Back")
		var AnimationLeft = create_tween()
		AnimationLeft.tween_property(LeftAnimation, "scale", Vector2(1,1), 10)
		await get_tree().create_timer(0.5).timeout
		LeftAnimation.sprite_frames.remove_frame("Back", 0)

func StoleAnimation():
	pass

func _process(delta: float) -> void:
	if int(EnterAnimation.scale[0]) == 9:
		EnterAnimation.stop()
		EnterAnimation.set_frame_and_progress(4,0.0)
		tween.kill()
	if int(LeftAnimation.scale[0])== 2:
		LeftAnimation.stop()
		LeftAnimation.hide()
		
	HUD.get_children()[0].hide()
