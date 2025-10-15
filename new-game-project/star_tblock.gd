extends Sprite2D
@onready var parent = $".."

@onready var button1 = null
@onready var area = null
var mousepressed = false
func _ready() -> void:
	button1 = self.get_child(0)
	area = self.get_child(1)
	button1.button_down.connect(pressed)
	button1.button_up.connect(unpressed)
func _process(delta: float) -> void:
	if mousepressed == true:
		self.position = get_global_mouse_position()
func pressed()->void:
	mousepressed = true
func unpressed()->void:
	if area.has_overlapping_areas():
		var otherareas = area.get_overlapping_areas()
		
		var isoriginalareahigher = größerkleiner(area.get_parent(),otherareas[0].get_parent())
		
		if isoriginalareahigher ==true:
			
			if not self.is_in_group("Startblock"):
				var gounderposition = otherareas[0].get_parent().position+  Vector2(0,146)
				var allowed = true
					
				for i in parent.get_children():
					if i.position == gounderposition:
						allowed = false
						break					
				
				if allowed :
					self.position = gounderposition
		else:
			print("top")
			var goupposition = otherareas[0].get_parent().position - Vector2(0,146)
			if not  otherareas[0].get_parent().is_in_group("Startblock"):
				var allowed = true
				for i in parent.get_children():
					if i.position == goupposition:
						allowed = false
						break		
						pass
				if allowed:
					self.position = goupposition
				
						
						
	
	mousepressed = false
func größerkleiner(a,b)->bool:
	print(a.position.y,b.position.y)
	
	return a.position.y > b.position.y  #true

	
