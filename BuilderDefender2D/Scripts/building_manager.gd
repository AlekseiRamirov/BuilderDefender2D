class_name BuildingManager extends Node

@export var camera: Camera2D
@export var followObjectCam: Node2D
@export var containerBuilding: Node2D
var buildingType: Resource
var buildingTypeList: Resource = load("res://BuilderDefender2D/Resources/BuildingTypesData/ListBuildings.tres") as BuildingTypeList


# Called when the node enters the scene tree for the first time.
func _ready():
	buildingType = buildingTypeList.list[0]


func SpawnBuildingTypeScene(in_pos: Vector2):
	var instance_scene: Node2D = buildingType.scene.instantiate()
	instance_scene.position = in_pos
	containerBuilding.add_child(instance_scene)


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
