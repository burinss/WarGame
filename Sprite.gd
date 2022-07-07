extends Sprite


func _input(event):
	if event is InputEventSingleScreenDrag:
		print("drag")
	#OG code. It works but there are more then 2 ways to skin a cat.
	if event is InputEventSingleScreenTap and event.pressed and event.button_index == BUTTON_LEFT and event is InputEventSingleScreenDrag:
		if get_rect().has_point(to_local(event.position)):
			print("A click!")
		
	
	#good if you dont need to do something when the button is released
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if get_rect().has_point(get_local_mouse_position()):
			get_tree().set_input_as_handled()
			modulate = Color.blueviolet

	#if you need to do something when the buttons released
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			get_tree().set_input_as_handled()
			if event.pressed:
					modulate = Color.blueviolet
			else:
				modulate = Color.white

	
	#if you need to only select opague parts of the sprite replace get_rect()
	#with is_pixel_opaque(get_local_mouse_position())


