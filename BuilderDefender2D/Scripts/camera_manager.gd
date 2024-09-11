class_name CameraManager extends Node

@export var camera: Camera2D
@export var followObject: Node2D
@export var speed_movement: float = 250.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func move_object_to_follow(in_pos: Vector2, in_delta: float) -> void:
	in_pos.normalized()
	followObject.global_position = in_pos * speed_movement * in_delta
