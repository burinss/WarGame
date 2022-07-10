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
onready var camera = $Camera2D

var arr_elements_label
var arr_buttons
var last_province
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _init():
	self.hide()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	arr_elements_label = [province_name, user_name, population, 
	Gold_resource, Uran_resource, Capital, Defence_bonus, Ideology]
	arr_buttons = [button_recruit, button_destoy,
	button_disslove, button_move, button_build]
	print(arr_elements_label)
	var position = 0.0
	for x in arr_elements_label:
		x.add_constant_override("margin_top", position)
		position+=20.0
		x.add_constant_override("margin_botton", position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var province = get_node('/root/Game').selected_province
	if province!=null and province!=last_province:
		last_province = province
		if province.water == false:
			self.show()
			
			province_name.text=str(province.name)
			population.text = population.text.split(":")[0]+":"+str(province.population)
			
			if province.gold_resource > 0:
				Gold_resource.show()
				Gold_resource.text = Gold_resource.text.split(":")[0]+":"+str(province.gold_resource)
			else: Gold_resource.hide()
			
			if province.uran_resource > 0:
				Uran_resource.show()
				Uran_resource.text = Uran_resource.text.split(":")[0]+":"+str(province.uran_resource)
			else: Uran_resource.hide()
			
			if province.defence_bonus > 0:
				Defence_bonus.show()
				Defence_bonus.text = Defence_bonus.text.split(":")[0]+":"+str(province.defence_bonus)
			else: Defence_bonus.hide()
			
			if province.capital:
				Capital.show()
			else:
				Capital.hide()
			Ideology.text = "Republic"
			user_name.hide()
		else:
			self.hide()

