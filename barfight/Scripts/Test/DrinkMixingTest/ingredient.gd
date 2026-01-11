extends Resource
class_name Ingredient

enum Category {
	BASE,
	SWEETENER,
	GARNISH,
	ICE
}

@export var name: String
@export var category: Category

@export var strength: int = 0
@export var sweetness: int = 0
@export var flavour_intensity: int = 0
@export var harshness: int = 0

@export var icon: Texture2D
@export var liquid_color: Color = Color.WHITE
