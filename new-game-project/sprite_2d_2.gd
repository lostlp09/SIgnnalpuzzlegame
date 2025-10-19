extends Sprite2D
@onready var player = $"../CharacterBody2D"
@onready var button =$Button
@onready var Startchild = $"../StarTblock/all children"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(start)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func start()-> void:
	if  Allfmoverotatefunctions.Starting == false:
		Allfmoverotatefunctions.runningfunc = false
		Allfmoverotatefunctions.Starting = true
		var blockslist  = 0
		

		player.position = Vector2(720.0,605.0)
		player.rotation = 0

		print(blockslist)

		while  Startchild.get_child(blockslist) != null and Allfmoverotatefunctions.Starting == true:
			if Startchild.get_child(blockslist).is_in_group("move") and  Allfmoverotatefunctions.runningfunc == false:
				
				var anzahl = int(Startchild.get_child(blockslist).get_child(2).text)	
				Allfmoverotatefunctions.move(anzahl,player)
				Allfmoverotatefunctions.runningfunc = true
				blockslist += 1
			elif Startchild.get_child(blockslist).is_in_group("Rotate")  and Allfmoverotatefunctions.runningfunc == false :
			
				var degree = int(Startchild.get_child(blockslist).get_child(2).text)
				Allfmoverotatefunctions.runningfunc = true
				Allfmoverotatefunctions.Rotate(degree,player)
				blockslist += 1
			else:
				
				await get_tree().create_timer(0.1).timeout
				if Allfmoverotatefunctions.Starting == false:
					blockslist = 300000
				
	
	
		
		
		


func _on_reset_pressed() -> void:
	Allfmoverotatefunctions.Starting = false
	Allfmoverotatefunctions.runningfunc = false
	player.position = Vector2(720.0,605.0)
	player.rotation = 0
