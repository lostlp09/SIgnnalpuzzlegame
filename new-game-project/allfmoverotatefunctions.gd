extends Node
var speed = 82.8
var Starting = false
var character =  null
var runningfunc = false
var timer = 0
var runningeverything = false
func  move(a,Character)->void:
	var anzahl = a * 0.58
	var isdone = false
	if Starting == true:
		character = Character
		while  isdone == false:
			if Starting == false:
				isdone = true
				timer = 0
				character =null
			if anzahl <= timer:
				for i in Character.get_child(2).get_overlapping_areas():
					if i.get_parent().name == "Escape":
						get_tree().change_scene_to_file("res://Scenes/levelmenü.tscn")
				print("smaller")
				isdone = true
				timer = 0
				character =null
				Allfmoverotatefunctions.runningfunc = false
			await  get_tree().create_timer(0.01).timeout	
	else:
		timer=0
func  Rotate(a,Character)->void:
	if Starting == true:
		print(Character.rotation)
		Character.rotation = deg_to_rad(a)
		print(Character.rotation)
		Allfmoverotatefunctions.runningfunc = false
	else:
		Allfmoverotatefunctions.runningfunc = false
		


func _physics_process(delta: float) -> void:


	if character != null:
		if Starting == true:
			timer += delta
			var direction = Vector2.RIGHT.rotated(character.rotation)
			character.velocity= speed * direction
			character.move_and_slide()
		else:
			character.velocity= Vector2(0,0)
			

		character.move_and_slide()
	
	
	
	
