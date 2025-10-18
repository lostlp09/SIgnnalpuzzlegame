extends Sprite2D
@onready var  move  = $"../Move"
@onready var  rotate  = $"../Rotateblock"
var clicked1 = 0
var clicked = 2
func _on_button_pressed() -> void:
	var clone = rotate.duplicate()
	self.get_parent().add_child(clone)
	clone.position = Vector2(340.0,153.0)

	


func _on_button_2_pressed() -> void:
	var clone = move.duplicate()
	self.get_parent().add_child(clone)
	clone.position = Vector2(340.0,153.0)
