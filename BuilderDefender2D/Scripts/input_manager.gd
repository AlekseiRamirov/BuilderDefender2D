class_name InputManager extends Node

enum ACTIONS {
	Up,
	Down,
	Right,
	Left
}

@export var buildingManager: BuildingManager
@export var cameraManager: CameraManager
@export var mouseSelector: Node2D

var mouse_pos: Vector2 = Vector2.ZERO
var move_dir: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _process(delta):
	mouse_pos = cameraManager.camera.get_local_mouse_position()
	mouseSelector.global_position = mouse_pos

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Down"):
		move_dir.y += 1
	if Input.is_action_pressed("Up"):
		move_dir.y -= 1
	if Input.is_action_pressed("Right"):
		move_dir.x += 1
	if Input.is_action_pressed("Left"):
		move_dir.x -= 1
	cameraManager.move_object_to_follow(move_dir, delta)


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			buildingManager.SpawnBuildingTypeScene(mouse_pos)
	if event is InputEventKey:
		if event.keycode == KEY_1 && event.pressed:
			buildingManager.SelectBuildingTypeToSpawn(1)
		if event.keycode == KEY_2 && event.pressed:
			buildingManager.SelectBuildingTypeToSpawn(2)
		if event.keycode == KEY_3 && event.pressed:
			buildingManager.SelectBuildingTypeToSpawn(3)
