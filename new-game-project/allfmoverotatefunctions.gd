extends Node
var speed = 82.8
var Starting = false
var character =  null
var runningfunc = false
var timer = 0
var runningeverything = false
func  move(a,Character)->void:
	var anzahl = 96 * a
	for i in range(0,anzahl):
		Character.move_local_x(1)
		await get_tree().create_timer(0.01).timeout
	Allfmoverotatefunctions.runningfunc = false
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
	
	
	
	
