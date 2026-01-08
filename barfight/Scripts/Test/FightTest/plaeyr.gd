extends Node2D

@onready var label: Label = $"../Control/CanvasLayer/Label"

# Alliases to access states easier 
var attack_states = FighterStates.Attack
var fighter_states = FighterStates.FighterState

var score := 0
var state = FighterStates.FighterState.STANDBY

func _ready():
	update_score()

func take_hit(amount: int, attack: FighterStates.Attack):
	if (attack == attack_states.LEFT and state != fighter_states.DODGE_LEFT) or (attack == attack_states.RIGHT and state != fighter_states.DODGE_RIGHT):
		score += amount
		update_score()

func update_score():
	label.text = "Score: " + str(score)

func _process(_delta):
	check_inputs()

func check_inputs():
	if Input.is_action_pressed("BlockLeft"):
		dodge_left()

	if Input.is_action_pressed("BlockRight"):
		dodge_right()

func dodge_left():
	await get_tree().create_timer(0.2).timeout
	state = fighter_states.DODGE_LEFT
	await get_tree().create_timer(0.5).timeout
	state = fighter_states.STANDBY
	
func dodge_right():
	await get_tree().create_timer(0.2).timeout
	state = fighter_states.DODGE_RIGHT
	await get_tree().create_timer(0.5).timeout
	state = fighter_states.STANDBY
