extends Node

##SIGNALS
signal onResourceAmountChanged

## VARIABLES
var resourceAmountDictionary: Dictionary
var resourceTypeList: ResourceTypeList = preload("res://BuilderDefender2D/Resources/ResourcesTypes/ResourceTypeList.tres")
# Called when the node enters the scene tree for the first time.
func _ready():
	for resourceType in resourceTypeList.list:
		resourceAmountDictionary[resourceType] = 0
	TestLogAmountResourcesDictionary()

func AddResourceAmount(resourceType: ResourceType, amount: int):
	resourceAmountDictionary[resourceType] += amount
	emit_signal("onResourceAmountChanged")


func GetResourceAmount(resourceType: ResourceType) -> int:
	var resourceAmount: int = resourceAmountDictionary[resourceType]
	return resourceAmount


func TestLogAmountResourcesDictionary():
	for resourceTypeKey in resourceAmountDictionary.keys():
		print(resourceTypeKey.nameResource + ": " + str(resourceAmountDictionary[resourceTypeKey]))
