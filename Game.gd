extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var drag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x=100
	position.y=100

	var file = File.new()
	file.open("res://data1.json", file.READ)
	var text = file.get_as_text()
	var result_json = JSON.parse(text).result
	file.close()
	
	var entities = result_json["entities"]
	
	for entity in entities:
		var mySprite = Sprite.new()
		var script = load('res://Sprite.gd')
		var texture = load("res://cropped//" + entity['Name'])
		mySprite.texture = texture
		mySprite.position = Vector2(entity['x'],entity['y'])
		mySprite.scale = Vector2(1.0,1.0)
		mySprite.centered=false
		mySprite.set_script(script)
		add_child(mySprite)

func _unhandled_input(event):
	print(event)
	if event is InputEventSingleScreenDrag:
		$Camera2D.position-=event.relative
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	$Camera2D.position = init_camera_pos - (get_global_mouse_position()-drag_position)
#	pass

