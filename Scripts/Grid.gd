extends Control

@onready
var block = preload("res://Scenes/Objects/block.tscn")
signal lockBlock

var currentLevel = 0

var grid_size = Vector2(8, 16)
var cell_size = Vector2(40, 40) # 2.5x 16x16

func _ready():
	createNewBlock()

func _input(event):
	if event.is_action_pressed("Lock"):
		print("Lock!")
		lockBlock.emit()
		
		createNewBlock()

func createNewBlock():
	if currentLevel < grid_size.y:
		var newBlock = block.instantiate()
		lockBlock.connect(newBlock.lock)
		add_child(newBlock)
		currentLevel+=1	
	else:
		print("Board Full!")

func _draw():
	draw_grid()

func draw_grid():
	var start = Vector2()
	var end = Vector2()

	# Draw horizontal lines
	for row in range(grid_size.y + 1):
		start.x = (-grid_size.x * cell_size.x)/2
		start.y = row * cell_size.y + (-grid_size.y * cell_size.y)/2
		end.x = grid_size.x * cell_size.x + (-grid_size.x * cell_size.x)/2
		end.y = row * cell_size.y+ (-grid_size.y * cell_size.y)/2
		draw_line(start, end, Color(1, 1, 1))

	# Draw vertical lines
	for col in range(grid_size.x + 1):
		start.x = col * cell_size.x + (-grid_size.x * cell_size.x)/2
		start.y = (-grid_size.y * cell_size.y)/2
		end.x = col * cell_size.x + (-grid_size.x * cell_size.x)/2
		end.y = grid_size.y * cell_size.y + (-grid_size.y * cell_size.y)/2
		draw_line(start, end, Color(1, 1, 1))
