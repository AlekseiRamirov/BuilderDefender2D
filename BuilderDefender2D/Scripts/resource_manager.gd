extends Node

var resourceAmountDictionary: Dictionary
var resourceTypeList: ResourceTypeList = preload("res://BuilderDefender2D/Resources/ResourcesTypes/ResourceTypeList.tres")
# Called when the node enters the scene tree for the first time.
func _ready():
	for resourceType in resourceTypeList.list:
		resourceAmountDictionary[resourceType] = 0
	TestLogAmountResourcesDictionary()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func AddResourceAmount(resourceType: ResourceType, amount: int):
	resourceAmountDictionary[resourceType] += amount

func TestLogAmountResourcesDictionary():
	for resourceTypeKey in resourceAmountDictionary.keys():
		print(resourceTypeKey.nameResource + ": " + str(resourceAmountDictionary[resourceTypeKey]))
