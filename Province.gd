extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x=100
	position.y=100
	var dict = {}
	#var body = StaticBody2D.new()
	var file = File.new()
	file.open("res://data1.json", file.READ)
	var text = file.get_as_text()
	#print(dict.parse_json(text))
	var result_json = JSON.parse(text).result
	file.close()
# print something from the dictionnary for testing.
	var entities = result_json["entities"]
	for entity in entities:
		var mySprite = Sprite.new()
		#mySprite.texture = load("res://cropped//Albania_province_1.png")
		mySprite.texture = load("res://cropped//" + entity['Name'])
		mySprite.position = Vector2(entity['x'],entity['y'])
		#mySprite.rotate(angle)
		mySprite.scale = Vector2(1.0,1.0)
		add_child(mySprite)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
