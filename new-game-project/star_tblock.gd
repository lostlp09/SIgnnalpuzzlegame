extends Sprite2D
@onready var parent = $".."

@onready var button1 = null
@onready var area =null
var mousepressed = false
var stop = false
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
	var looparea= null
	if area.has_overlapping_areas():
		for i in area.get_overlapping_areas():
			if i.is_in_group("loop"):
				var isin = inloop(i)
				if isin:
					print("itsim")
					stop  = true	
				else:
					stop = false
				
			print(stop)

	
		var otherareas = area.get_overlapping_areas()
		var isoriginalareahigher = größerkleiner(area.get_parent(),otherareas[0].get_parent())
		if isoriginalareahigher ==true:
					
			if not self.is_in_group("Startblock"):
				var gounderposition = 0
				if  otherareas[0].get_parent().is_in_group("loop"):
					print("under")
					gounderposition = otherareas[0].get_parent().position+  Vector2(0,85)
				elif area.get_parent().is_in_group("loop"):
					gounderposition = otherareas[0].get_parent().position+  Vector2(0,112)
				else:
					gounderposition = otherareas[0].get_parent().position+  Vector2(0,78)
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
			var goupposition =0
			if  otherareas[0].get_parent().is_in_group("loop"):
				print("top")
						
				goupposition = otherareas[0].get_parent().position - Vector2(0,112)
			elif area.get_parent().is_in_group("loop"):
				if otherareas[0].get_parent().is_in_group("Startblock"):
					pass
				else:
					goupposition = otherareas[0].get_parent().position - Vector2(0,85)
					
			else:	
				goupposition = otherareas[0].get_parent().position - Vector2(0,78)
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
		var last_object = null
		for i in allchildren.get_children():
			if last_object == null:
				if i.is_in_group("loop"):
					i.position= startpos + Vector2(0,112)
				else:
					i.position =startpos + Vector2(0,78)
				last_object = i
						
			else:
				if i.is_in_group("loop"):
					i.position = Vector2(startpos.x ,last_object.position.y + 112)
							
				else:
					if last_object.is_in_group("loop"):
						i.position = Vector2(startpos.x ,last_object.position.y + 85)
					else:
						i.position = Vector2(startpos.x ,last_object.position.y + 78)

				last_object = i
	else:#stoppen
		stop = false
		if self.get_parent() == allchildren:
			var startpos = allchildren.get_parent().position
			self.reparent(parent)
			var last_object = null
			for i in allchildren.get_children():
				if last_object == null:
					if i.is_in_group("loop"):
						i.position= startpos + Vector2(0,112)
					else:
						i.position =startpos + Vector2(0,78)
					last_object = i
				else:
					if i.is_in_group("loop"):
						i.position = Vector2(startpos.x ,last_object.position.y + 112)
						
					else:
						if last_object.is_in_group("loop"):
							i.position = Vector2(startpos.x ,last_object.position.y + 85)
						else:
							i.position = Vector2(startpos.x ,last_object.position.y + 78)

					last_object = i
		
	self.set_meta("oldpos",self.position)
	mousepressed = false
func größerkleiner(a,b)->bool:
	print(a.position.y,b.position.y)
	
	return a.position.y > b.position.y  #true
	
func inloop(a)->bool:
	#darf nicht kleiner als  -30 sein
	#darf nicht über 5 sein
	var distance = self.position.distance_to(a.get_parent().position)
	
	if  distance <= 10:
		return true
	else:
		return false
		


	


	
