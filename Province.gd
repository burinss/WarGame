extends Area2D

var population = 0
var max_build = 0
var defence_bonus = 0
var uran_resource = 0
var gold_resource = 0
var size_resource = 0.2
var water = false
var capital = false
#onready var the_sprite = get_node("path/to/sprite")

var arr_capital = ["Ukraine_province_10png", "Moskovia_province_41png", "Moldova_province_1png", 
"Slovenia_province_1png", "Denmark_province_1png", "Belarus_province_4png", "Icelandpng", " Greenlandpng",
"Norway_province_2png", "Finland_province_1png", "Sweden_province_6png", "Estonia_province_3png",
"Latvia_province_1png", "Lithuania_province_4png", "Poland_province_11png", "Slovakia_province_1png",
"Romania_province_6png", "Hungary_province_2png", "Serbia_province_4png", "Albania_province_1png",
"Macedonia_province_1png", "Turkey_province_4png", "Bulgaria_province_4png", "Greece_province_3png",
"Montenegro_province_1png", "Bosnia_province_1png", "Croatia_province_2png", "Italia_province_7png",
"Kosovo_province_1png", "Switzerland_province_1png", "Austria_province_3png", "Czech_province_2png",
"France_province_7png", "Spain_province_8png", "Portugal_province_3png", "Great_Britain_province_11png",
"Ireland_province_2png", "Germany_province_7png", "Greenlandpng", "Azerbaijan_province_1png", "Armenia_province_1png",
"Georgia_province_1png", "Luxembourg_province_1png", "Belgium_province_1png", "Netherlands_province_1png"]

func _ready() -> void:
	init()
	input_pickable = true
	self.connect("input_event", self, "_on_Area2D_input_event")
	

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		print("Clicked")
		print(str(get_children()))
		if event.pressed:
			get_node('/root/Game').selected_province=self
			modulate = Color.blueviolet
		else:
			modulate = Color.white
			
func init():
	water = false
	var province = get_children()[1]
	print(str(province).split(":")[0])
	if "Water" in str(province): water = true
	elif arr_capital.has(str(province).split(":")[0]):
		capital = true
	if water == false:
		population = int(rand_range(0, 100000))
		max_build = 5
		defence_bonus = 0
		if rand_range(0, 100)>90:
			uran_resource = int(rand_range(0, 100))
		if rand_range(0, 100)>60:
			gold_resource = int(rand_range(0, 20000))
			var sprite_gold = Sprite.new()
			sprite_gold.texture = load("res://icons//gold.png")
			sprite_gold.position = Vector2(province.texture.get_width()/3.5, province.texture.get_width()/2.5)
			sprite_gold.scale = Vector2(size_resource, size_resource)
			sprite_gold.name = "Gold_icon"
			add_child(sprite_gold)
	
	
func _input(event):
	var drag = false
	if event is InputEventSingleScreenDrag:
		drag = true
		modulate = Color.white
	"""
	#OG code. It works but there are more then 2 ways to skin a cat.
	if event is InputEventSingleScreenTouch:
		if get_rect().has_point(get_local_mouse_position()):
			print("A click!")

	
	#good if you dont need to do something when the button is released
	if InputEventSingleScreenTouch:
		if get_rect().has_point(get_local_mouse_position()):
			get_tree().set_input_as_handled()
			modulate = Color.blueviolet
	
	#if you need to do something when the buttons released
	if event is InputEventSingleScreenTouch:
		if get_viewport_rect().has_point(get_local_mouse_position()):
			get_tree().set_input_as_handled()
			if event.pressed:
					modulate = Color.blueviolet
			else:
				modulate = Color.white
"""

	#if you need to only select opague parts of the sprite replace get_rect()
	#with is_pixel_opaque(get_local_mouse_position())


