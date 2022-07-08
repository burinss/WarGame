extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var drag = false
var name_state
var arr_color_state = {}
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
		name_state = entity['Name'].split("_")[0]

		mySprite.centered=false
		mySprite.texture = load("res://cropped//" + entity['Name'])
		#mySprite.position = Vector2(entity['x'],entity['y'])
		mySprite.scale = Vector2(1.0,1.0)
		
		set_color_province(mySprite)
		var script = load('res://Province.gd')
		set_collision(image, myArea)
		myArea.set_script(script)
		myArea.add_child(mySprite)
		add_child(myArea)
		
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
	
func set_color_province(sprite):
	var water = false
	if "Water" in name_state:
		water = true
	if name_state in arr_color_state.keys() and water==false:
		sprite.modulate = arr_color_state[name_state]
	elif water==false:
		var c = Color(rand_range(0.0, 1.0), rand_range(0.0, 1.0), rand_range(0.0, 1.0))
		sprite.modulate = c
		arr_color_state[name_state] = c

	
func _unhandled_input(event):
	if event is InputEventSingleScreenDrag:
		$Camera2D.position-=event.relative
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	$Camera2D.position = init_camera_pos - (get_global_mouse_position()-drag_position)
#	pass
