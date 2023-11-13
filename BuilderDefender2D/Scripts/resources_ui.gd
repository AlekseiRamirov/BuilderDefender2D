class_name ResourcesUI extends Node

@export var resource_template: PackedScene = preload("res://BuilderDefender2D/Scenes/hud/ui_resource_template.tscn")
var resourceTypeList: ResourceTypeList = preload("res://BuilderDefender2D/Resources/ResourcesTypes/ResourceTypeList.tres")
var resourceTemplateUiDictionary: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	GenerateResourceTemplates()
	ResourceManager.connect("onResourceAmountChanged", UpdateAmountResourceTemplate)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#	UpdateAmountResourceTemplate()


func GenerateResourceTemplates():
	for resourceType in resourceTypeList.list:
		var instance = resource_template.instantiate()
		instance.name = ("Template_Ui_" + resourceType.nameResource)
		var child_image: TextureRect = instance.get_child(0) as TextureRect
		child_image.set_texture(resourceType.spriteResource)
		resourceTemplateUiDictionary[resourceType] = instance
		add_child(instance)


func UpdateAmountResourceTemplate():
	for resourceType in resourceTypeList.list:
		var resourceTemplate = resourceTemplateUiDictionary[resourceType]
		var child_label: Label = resourceTemplate.get_child(1) as Label
		child_label.set_text("x " + str(ResourceManager.GetResourceAmount(resourceType)))
