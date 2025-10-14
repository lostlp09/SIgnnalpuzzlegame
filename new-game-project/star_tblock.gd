extends Sprite2D

@onready var button1 = $Button
var mousepressed = false

func _ready() -> void:
	button1.button_down.connect(pressed)
	button1.button_up.connect(unpressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mousepressed == true:
		self.position = get_global_mouse_position()
		

func pressed()->void:
	mousepressed = true
func unpressed()->void:
	mousepressed = false
	
