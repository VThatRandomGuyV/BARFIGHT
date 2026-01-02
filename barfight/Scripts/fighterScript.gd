extends Node2D

@onready var sprite: Sprite2D = $Sprite2D

# These will hold your images
var standby_texture: Texture2D
var attack_left_texture: Texture2D
var attack_right_texture: Texture2D

func _ready():
	# Load images into memory
	standby_texture = load("res://Assets/normalFighter.png")
	attack_left_texture = load("res://Assets/leftFighter.png")
	attack_right_texture = load("res://Assets/rightFighter.png")

	# Start with standby
	sprite.texture = standby_texture

	# Start the random switching loop
	randomize()
	start_random_behavior()

func start_random_behavior():
	while true:
		await get_tree().create_timer(randf_range(0.5, 1.5)).timeout
		switch_state_randomly()

func switch_state_randomly():
	var choice = randi() % 3

	if choice == 0:
		sprite.texture = standby_texture
	elif choice == 1:
		sprite.texture = attack_left_texture
	else:
		sprite.texture = attack_right_texture
