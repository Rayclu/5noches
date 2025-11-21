extends Control

@onready var texture_rect = get_node("TextureRect")
@onready var LeftAnimation:AnimatedSprite2D = get_node("Left")
@onready var button = get_node("Button")
@onready var ClientPanel = $Nube

var tween = create_tween()
var i = 0

func _ready() -> void:
	CLIENT.ChoseElementsToBuy()
	button.connect("pressed",Callable(self,"StartAnimation"))
	LeftAnimation.play("Enter")
	tween.tween_property(LeftAnimation, "scale", Vector2(10,10), 10)
	ClientPanel.hide()

func _input(event: InputEvent) -> void:   
	prints(Input.is_action_just_pressed("ui_accept"), i, !LeftAnimation.is_playing())
	if Input.is_action_just_pressed("ui_accept")&& i==0 && !LeftAnimation.is_playing():
		LeftAnimation.show()
		LeftAnimation.play("Enter")
		CLIENT.ChoseElementsToBuy()
		tween.kill()
		tween = create_tween()
		tween.tween_property(LeftAnimation, "scale", Vector2(10, 10), 10)

func StartAnimation():
	if LeftAnimation.animation == "Enter" && i==1:
		ClientPanel.hide()
		LeftAnimation.scale = Vector2(9,9)
		LeftAnimation.play("Back")
		var AnimationLeft = create_tween()
		AnimationLeft.tween_property(LeftAnimation, "scale", Vector2(1,1), 10)
		await get_tree().create_timer(0.5).timeout
		LeftAnimation.sprite_frames.remove_frame("Back", 0)
		i-=1

func StoleAnimation():
	pass

func _process(delta: float) -> void:
	if int(LeftAnimation.scale[0]) == 9 && LeftAnimation.animation == "Enter":
		LeftAnimation.stop()
		LeftAnimation.set_frame_and_progress(4,0.0)
		tween.kill()
		ClientPanel.show()
		i=1
	if int(LeftAnimation.scale[0])== 2 && LeftAnimation.animation == "Back":
		LeftAnimation.stop()
		LeftAnimation.hide()
		
	HUD.get_children()[0].hide()
