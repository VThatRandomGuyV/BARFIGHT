extends Node2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var player: Node2D = $"../PLayer"

# Alliases to access states easier 
var attacks = FighterStates.Attack
var fighter_states = FighterStates.FighterState

# These will hold your images
var standby_texture: Texture2D
var attack_left_prep_texture: Texture2D
var attack_left_texture: Texture2D
var attack_right_prep_texture: Texture2D
var attack_right_texture: Texture2D

func _ready():
	# Load images into memory
	standby_texture = load("res://Assets/Test/normalFighter.png")
	attack_left_texture = load("res://Assets/Test/leftFighter.png")
	attack_left_prep_texture = load("res://Assets/Test/leftPrepFighter.png")
	attack_right_texture = load("res://Assets/Test/rightFighter.png")
	attack_right_prep_texture = load("res://Assets/Test/rightPrepFighter.png")

	# Start with standby
	sprite.texture = standby_texture

	# Start the random switching loop
	randomize()
	start_random_behavior()

func start_random_behavior():
	while true:
		await get_tree().create_timer(1.5).timeout
		switch_state_randomly()

func switch_state_randomly():
	var choice = randi() % 3

	if choice == 0:
		sprite.texture = standby_texture
	elif choice == 1:
		sprite.texture = attack_left_prep_texture
		await get_tree().create_timer(0.7).timeout
		sprite.texture = attack_left_texture
		player.take_hit(1, attacks.LEFT)
	else:
		sprite.texture = attack_right_prep_texture
		await get_tree().create_timer(0.7).timeout
		sprite.texture = attack_right_texture
		player.take_hit(1, attacks.RIGHT)
