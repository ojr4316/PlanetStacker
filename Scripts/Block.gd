extends Control

var blockSpeed = 20
var direction = 1

@onready
var grid_size = get_parent().grid_size
@onready
var cell_size = get_parent().cell_size
@onready
var currentLevel = get_parent().currentLevel

var textureSize = 40

var blockX = 0 # Left
var blockY = 0 # Bottom

var counter = 0

func _ready():
	position.y = grid_size.y * cell_size.y/2 - textureSize - 1 - (currentLevel*cell_size.y)
	position.x = (-grid_size.x * cell_size.x)/2

func _process(delta):
	if blockSpeed > 0:
		if counter < blockSpeed:
			counter+=1
		else:
			counter = 0
			blockX += direction
			if blockX == grid_size.x-1 or blockX <= 0:
				direction *= -1
		
		position.x = (-grid_size.x * cell_size.x)/2 + cell_size.x * blockX

func lock():
	blockSpeed = 0
	# TODO: Add logic for falling
