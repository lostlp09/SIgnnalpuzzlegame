extends Sprite2D
@onready var player = $"../Sprite2D"
@onready var button =$Button
@onready var Startchild = $"../StarTblock/all children"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(start)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func start()-> void:
	var blockslist  = 0
	
	print("hi")

	while  Startchild.get_child(blockslist) != null:
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
			print("test")
		
		
