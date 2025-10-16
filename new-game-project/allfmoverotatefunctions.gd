extends Node


func  move(a,Character)->void:
	var anzahl = 96 * a
	for i in range(0,anzahl):
		print("hi")
		Character.move_local_x(1)
		await get_tree().create_timer(0.01).timeout
		
	
	pass
	

func  Rotate()->void:
	pass
	
