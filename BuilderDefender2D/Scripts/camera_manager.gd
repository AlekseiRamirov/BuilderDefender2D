class_name CameraManager extends Node

@export_subgroup("Settings references")
@export var camera: Camera2D
@export var phantomCamera: PhantomCamera2D
@export var followObject: Node2D

@export_subgroup("Settings camera")
@export var speed_movement: float = 250.0
@export var multiplier_zoom: float = 1.0

var camera_zoom: Vector2 = Vector2.ONE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func move_object_to_follow(in_pos: Vector2, in_delta: float) -> void:
	in_pos.normalized()
	followObject.global_position = in_pos * speed_movement * in_delta

func zoom_camera(in_zoom: Vector2, in_delta) -> void:
	camera_zoom = phantomCamera.get_zoom()
	var calculated_zoom: Vector2 = camera_zoom + (in_zoom * multiplier_zoom * in_delta)
	var clamped_zoom: Vector2 = clamp(calculated_zoom, Vector2(0.7, 0.7), Vector2(2.0, 2.0))
	phantomCamera.set_zoom(clamped_zoom)
