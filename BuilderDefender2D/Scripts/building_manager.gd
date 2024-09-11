class_name BuildingManager extends Node

@export var camera: Camera2D
@export var mouseSelector: Node2D
var buildingType: Resource
var buildingTypeList: Resource = load("res://BuilderDefender2D/Resources/BuildingTypesData/ListBuildings.tres") as BuildingTypeList
var pos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	buildingType = buildingTypeList.list[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos = GetMouseWorldPosition2D()
	mouseSelector.global_position = pos


func GetMouseWorldPosition2D() -> Vector2:
	var mouseWorldPosition: Vector2 = camera.get_local_mouse_position()
	return mouseWorldPosition


func SpawnBuildingTypeScene():
	var instance_scene: Node2D = buildingType.scene.instantiate()
	instance_scene.position = pos
	add_child(instance_scene)


func SelectBuildingTypeToSpawn(inputKey: int):
	if not inputKey:
		print("Input key not valid")
		return
	match inputKey:
		1:
			buildingType = buildingTypeList.list[0]
		2:
			buildingType = buildingTypeList.list[1]
		3:
			buildingType = buildingTypeList.list[2]
