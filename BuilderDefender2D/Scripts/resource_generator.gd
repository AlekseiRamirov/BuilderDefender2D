class_name ResourceGenerator extends Node

@onready var timer: Timer = %Timer
var totalTimeTimer: float = 1.0
var waitTimeTimer: float = 1.0
@export var resourceGeneratorData: ResourceGeneratorData
var resourceType: ResourceType

# Called when the node enters the scene tree for the first time.
func _ready():
	if resourceGeneratorData != null:
		resourceType = resourceGeneratorData.resourceType
		totalTimeTimer = resourceGeneratorData.totalTimeTimer
		waitTimeTimer = resourceGeneratorData.waitTimeTimer
	else:
		print("BuildingTypeHolder is null...")
	timer.wait_time = waitTimeTimer
	timer.start(totalTimeTimer)


func _on_timer_timeout():
	ResourceManager.AddResourceAmount(resourceType, 1)
	timer.wait_time = waitTimeTimer
	print("Ding!" + ": "+ resourceGeneratorData.resourceType.nameResource)
