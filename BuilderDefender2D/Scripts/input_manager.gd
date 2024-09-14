class_name InputManager extends Node

@export var buildingManager: BuildingManager
@export var cameraManager: CameraManager
@export var mouseSelector: Node2D

var mouse_pos: Vector2 = Vector2.ZERO
var move_dir: Vector2 = Vector2.ZERO
var zoom_dir: Vector2 = Vector2.ONE

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _process(delta):
	mouse_pos = cameraManager.camera.get_local_mouse_position()
	mouseSelector.global_position = mouse_pos


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
		print("Wheel up?")
		cameraManager.zoom_camera(zoom_dir, delta)
	if Input.is_action_just_released("Wheel Down"):
		print("Wheel down?")
		cameraManager.zoom_camera(-zoom_dir, delta)


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
	
	#if event.is_action_pressed("Wheel Up"):
		#print("Wheel up?")
		#zoom_dir.x += 1
		#zoom_dir.y += 1
		#cameraManager.zoom_camera(zoom_dir)
	#if event.is_action_pressed("Wheel Down"):
		#print("Wheel down?")
		#zoom_dir.x -= 1
		#zoom_dir.y -= 1
		#cameraManager.zoom_camera(zoom_dir)
