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
	print("hi")
	for i in Startchild.get_children():
		if i.is_in_group("move"):
			var anzahl = int(i.get_child(2).text)
			Allfmoverotatefunctions.move(anzahl,player)
		elif i.is_in_group("Rotate"):
			pass
		
