extends Panel

@onready var textureButton = get_node("TextureButton")
@onready var texture_rect = get_node("TextureRect")
@onready var labelStock = get_node("Label")
@onready var ArrayObjects = get_node("../../../..").LIST_OF_ELEMENTS_SELECTEDS

func _ready() -> void:
	textureButton.pressed.connect(DeleteElement)

func DeleteElement():
	var i = 0
	if !texture_rect.texture || len(ArrayObjects) == 0:
		return
	for objects in ArrayObjects:
		if !texture_rect.texture || len(ArrayObjects) == 0:
			return
		if texture_rect.texture.load_path == load(objects["ref"].image).load_path:
			if int(objects["CuSelect"]) == 1:
				labelStock.text = ""
				texture_rect.texture = null
				ArrayObjects.pop_at(i)
				var normal = StyleBoxFlat.new()
				normal.bg_color = Color8(22,22,22)
				normal.set_corner_radius_all(25)
				self.add_theme_stylebox_override("panel",normal)
				objects["ref"].stock+=1
			else:
				objects["CuSelect"] = int(objects["CuSelect"])
				objects["CuSelect"] -=1
				objects["totalPrice"] = objects["ref"].value * objects["CuSelect"] 
				labelStock.text = str(objects["CuSelect"])
				
				objects["ref"].stock+=1
				return
		i+=1
