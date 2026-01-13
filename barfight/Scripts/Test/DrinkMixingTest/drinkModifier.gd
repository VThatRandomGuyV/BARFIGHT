extends Node2D

signal base_changed(base:Ingredient)

@onready var base_button = $Button

var base: Ingredient=null
var selected_base: Ingredient=null

func _ready():
	base_button.pressed.connect(base_confirmed)
	
func select_base(ingredient:Ingredient):
	if ingredient != null:
		selected_base = ingredient

func base_confirmed():
	if selected_base == null:
		return
	base = selected_base	
	base_changed.emit(base)
