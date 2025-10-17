extends Sprite2D
@onready var parent = $".."

@onready var button1 = null
@onready var area = null
var mousepressed = false
@onready var allchildren = $"../StarTblock/all children"
func _ready() -> void:
	button1 = self.get_child(0)
	area = self.get_child(1)
	button1.button_down.connect(pressed)
	button1.button_up.connect(unpressed)
func _process(delta: float) -> void:
	if mousepressed == true and  not self.is_in_group("Startblock"):
		self.position = get_global_mouse_position()
func pressed()->void:
	mousepressed = true
func unpressed()->void:
	if area.has_overlapping_areas():
		var otherareas = area.get_overlapping_areas()
		
		var isoriginalareahigher = größerkleiner(area.get_parent(),otherareas[0].get_parent())
		
		if isoriginalareahigher ==true:
			
			if not self.is_in_group("Startblock"):
				var gounderposition = otherareas[0].get_parent().position+  Vector2(0,78)
				var allowed = true
					
				for i in parent.get_children():
					if i.position == gounderposition:
						allowed = false
						break					
				
				if allowed :
					var oldpos = self.get_meta("oldpos")
					self.position = gounderposition
					if self.get_parent() == allchildren and not oldpos == self.position: 
						self.reparent(parent)
					if(otherareas[0].get_parent() ==$"../StarTblock" or otherareas[0].get_parent().get_parent() ==allchildren) and not oldpos == self.position:
						self.reparent(allchildren)		
		else:
			print("top")
			var goupposition = otherareas[0].get_parent().position - Vector2(0,78)
			if not  otherareas[0].get_parent().is_in_group("Startblock"):
				var allowed = true
				for i in parent.get_children():
					if i.position == goupposition:
						allowed = false
						break		
				if allowed:
					var oldpos = self.get_meta("oldpos")
					self.position = goupposition
					if self.get_parent() == allchildren and  not oldpos == self.position: 
						self.reparent(parent)
					if (otherareas[0].get_parent() ==$"../StarTblock" or otherareas[0].get_parent().get_parent()==allchildren) and  not oldpos == self.position:
						self.reparent(allchildren)	
		var startpos = allchildren.get_parent().position
		var steigen  = 0
		for i in allchildren.get_children():
			print(i)
			steigen += 1
			i.position = startpos
			i.position.y += 78 * steigen


	
	else:
		
		if self.get_parent() == allchildren:
			var startpos = allchildren.get_parent().position
			self.reparent(parent)
			var steigen  = 0
			for i in allchildren.get_children():
				print(i)
				steigen += 1
				i.position = startpos
				i.position.y += 60 * steigen
				
		
							
	self.set_meta("oldpos",self.position)
	mousepressed = false
func größerkleiner(a,b)->bool:
	print(a.position.y,b.position.y)
	
	return a.position.y > b.position.y  #true

	
