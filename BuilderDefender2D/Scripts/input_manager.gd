class_name InputManager extends Node

@export var buildingManager: BuildingManager

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			buildingManager.SpawnBuildingTypeScene()
	if event is InputEventKey:
		if event.keycode == KEY_1 && event.pressed:
			buildingManager.SelectBuildingTypeToSpawn(1)
		if event.keycode == KEY_2 && event.pressed:
			buildingManager.SelectBuildingTypeToSpawn(2)
		if event.keycode == KEY_3 && event.pressed:
			buildingManager.SelectBuildingTypeToSpawn(3)
