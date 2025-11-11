extends Node

signal hit

func _on_body_entered():
	hit.emit()
