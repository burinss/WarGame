extends VBoxContainer

onready var button_recruit = $Recruit
onready var button_move = $Move
onready var button_build = $Build
onready var button_disslove = $Disslove
onready var button_destroy = $Destroy
var last_province
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	var province = get_node('/root/Game').selected_province
	if province!=null and province!=last_province:
		last_province = province
		#if province.water:
			#get_parent().hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
