extends Area2D

var population 
var max_build
var defence_bonus
var uran_resource
var gold_resource

#onready var the_sprite = get_node("path/to/sprite")

func _ready() -> void:
	input_pickable = true
	self.connect("input_event", self, "_on_Area2D_input_event")
	

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		print("Clicked")
		print(str(get_children()))
		if event.pressed:
			modulate = Color.blueviolet
		else:
			modulate = Color.white
			
func init():
	population = int(rand_range(0, 100000))
	max_build = 5
	defence_bonus = 0
	if rand_range(0, 100)>80:
		uran_resource = int(rand_range(0, 100))
	if rand_range(0, 100)>50:
		gold_resource = int(rand_range(0, 20000))
		var s = Sprite.new()
		s.texture = load("res://icons//icon_gold.png")
		#mySprite.position = Vector2(entity['x'],entity['y'])
		s.scale = Vector2(1.0,1.0)
		s.centered = true
		s.position = position
		add_child(s)
		
	
	
	
func _input(event):
	var drag = false
	if event is InputEventSingleScreenDrag:
		drag = true
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


