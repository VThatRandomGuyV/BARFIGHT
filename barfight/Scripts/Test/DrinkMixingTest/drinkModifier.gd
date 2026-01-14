extends Node2D

signal base_changed(base:Ingredient)
signal mixers_changed(mixers:Array[Ingredient])
signal sweeteners_changed(sweeteners:Array[Ingredient])
signal garnishes_changed(garnishes:Array[Ingredient])

@onready var base_button = $Button
@onready var mixers_button = $Button
@onready var sweeteners_button = $Button
@onready var garnishes_button = $Button

var base: Ingredient=null
var selected_base: Ingredient=null
var mixers: Array[Ingredient] = []
var selected_mixers: Array[Ingredient]=[]
var sweeteners: Array[Ingredient]=[]
var selected_sweeteners: Array[Ingredient]=[] 
var garnishes: Array[Ingredient]=[]
var selected_garnishes: Array[Ingredient]=[] 

func _ready():
	base_button.pressed.connect(base_confirmed)
	mixers_button.pressed.connect(mixers_confirmed)
	sweeteners_button.pressed.connect(sweeteners_confirmed)
	garnishes_button.pressed.connect(garnishes_confirmed)

func select_base(ingredient:Ingredient):	
	selected_base = ingredient

func select_mixers(ingredient:Ingredient):
	var index = selected_mixers.find(ingredient)
	if index == -1 && selected_mixers.size()<1: 
		selected_mixers.append(ingredient)
	else:
		selected_mixers.remove_at(index)

func select_sweeteners(ingredient:Ingredient):
	var index = selected_sweeteners.find(ingredient)
	if index == -1 && selected_sweeteners.size()<1: 
		selected_sweeteners.append(ingredient)
	else:
		selected_sweeteners.remove_at(index)
		
func select_garnishes(ingredient:Ingredient):
	var index = selected_garnishes.find(ingredient)
	if index == -1 && selected_garnishes.size()<1: 
		selected_garnishes.append(ingredient)
	else:
		selected_garnishes.remove_at(index)

func base_confirmed():
	if selected_base == null:
		return
	base = selected_base	
	base_changed.emit(base)

func mixers_confirmed():
	if selected_mixers == []:
		return
	mixers = selected_mixers	
	mixers_changed.emit(mixers)

func sweeteners_confirmed():
	if selected_sweeteners == []:
		return
	sweeteners = selected_sweeteners	
	sweeteners_changed.emit(sweeteners)

func garnishes_confirmed():
	if selected_garnishes == []:
		return
	garnishes = selected_garnishes	
	garnishes_changed.emit(garnishes)
