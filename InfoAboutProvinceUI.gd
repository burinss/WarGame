extends VBoxContainer

onready var province_name = $Province_Name
onready var user_name = $Username
onready var population = $Population
onready var Gold_resource = $Gold_resource
onready var Uran_resource = $Uran_resource
onready var Capital = $Capital
onready var Defence_bonus = $Defence_bonus
onready var Ideology = $Ideology
onready var button_recruit = $Recruit
onready var button_move = $Move
onready var button_disslove =$Disslove
onready var button_build = $Build
onready var button_destoy = $Destroy


var arr_elements_label
var arr_buttons
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _init():
	arr_elements_label = [province_name, user_name, population, 
	Gold_resource, Uran_resource, Capital, Defence_bonus, Ideology]
	arr_buttons = [button_recruit, button_destoy,
	button_disslove, button_move, button_build]
	print(str(province_name))
	var position = 0.0
	for x in arr_elements_label:
		x.add_constant_override("margin_top", position)
		position+=20.0
		x.add_constant_override("margin_botton", position)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
