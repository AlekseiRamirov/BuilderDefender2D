class_name InputManager extends Node

@export var buildingManager: BuildingManager
@export var cameraManager: CameraManager
@export var mouseSelector: Node2D

var mouse_pos: Vector2 = Vector2.ZERO
var move_dir: Vector2 = Vector2.ZERO
var zoom_dir: Vector2 = Vector2.ONE

var resource_mouse_selector: Resource = preload("res://BuilderDefender2D/Textures/Cursor_resize.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(resource_mouse_selector,Input.CURSOR_ARROW, Vector2(8, 0))


func _process(delta):
	mouse_pos = cameraManager.camera.get_global_mouse_position()
	#mouseSelector.global_position = mouse_pos


func _physics_process(delta: float) -> void:
	# Zone to move camera with the invisible object
	if Input.is_action_pressed("Down"):
		move_dir.y += 1
	if Input.is_action_pressed("Up"):
		move_dir.y -= 1
	if Input.is_action_pressed("Right"):
		move_dir.x += 1
	if Input.is_action_pressed("Left"):
		move_dir.x -= 1
	cameraManager.move_object_to_follow(move_dir, delta)

	# Zone to zoom the camera
	if Input.is_action_just_released("Wheel Up"):
		cameraManager.zoom_camera(zoom_dir, delta)
	if Input.is_action_just_released("Wheel Down"):
		cameraManager.zoom_camera(-zoom_dir, delta)


func _unhandled_input(event: InputEvent) -> void:
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
