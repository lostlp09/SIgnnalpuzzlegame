extends Node
var runningfunc = false
var runningeverything = false
func  move(a,Character)->void:
	var anzahl = 96 * a
	for i in range(0,anzahl):
		Character.move_local_x(1)
		await get_tree().create_timer(0.01).timeout
	Allfmoverotatefunctions.runningfunc = false
func  Rotate(a,Character)->void:
	print(Character.rotation)
	Character.rotation = deg_to_rad(a)
	print(Character.rotation)
	Allfmoverotatefunctions.runningfunc = false

	
