extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	 # Replace with function body.
func _unhandled_input(event):
	if event is InputEventSingleScreenDrag:
		self.hide()
func _process(delta):
	var province = get_node('/root/Game').selected_province
	if province!=null:
		self.show()
	#if province == true:
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
