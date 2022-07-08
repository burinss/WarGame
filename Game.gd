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
		var myArea = Area2D.new()
		myArea.position = Vector2(entity['x'],entity['y'])
		var mySprite = Sprite.new()
		var image = Image.new()
		image.load("res://cropped//" + entity['Name'])
		mySprite.texture = load("res://cropped//" + entity['Name'])
		#mySprite.position = Vector2(entity['x'],entity['y'])
		mySprite.scale = Vector2(1.0,1.0)
		mySprite.centered=false
		var script = load('res://Sprite.gd')
		set_collision(image, myArea)
		myArea.set_script(script)
		myArea.add_child(mySprite)
		add_child(myArea)
		
	for x in self.get_children():
		print(str(x))
		#add_child(myArea)
	#pass # Replace with function body.
func set_collision(x, myArea):
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(x)
	var collider = CollisionPolygon2D.new()
	var polygons = bitmap.opaque_to_polygons(Rect2(Vector2(0, 0), bitmap.get_size()))
	for polygon in polygons:
		collider.polygon = polygon
	myArea.add_child(collider)
		
func _unhandled_input(event):
	if event is InputEventSingleScreenDrag:
		$Camera2D.position-=event.relative
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	$Camera2D.position = init_camera_pos - (get_global_mouse_position()-drag_position)
#	pass
