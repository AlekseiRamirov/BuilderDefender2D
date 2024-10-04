class_name ContainerBuildingButton extends Node

@export var button_building: PackedScene = preload("res://BuilderDefender2D/Scenes/hud/ui_building_button.tscn")
var buildingTypeList: Resource = load("res://BuilderDefender2D/Resources/BuildingTypesData/ListBuildings.tres") as BuildingTypeList

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for idx: int in buildingTypeList.list.size():
		var building_type: BuildingType = buildingTypeList.list[idx] as BuildingType
		var instance_button: PanelContainer = button_building.instantiate()
		instance_button.name = "button_%s" % building_type.nameBuilding
		var child_img: TextureButton = instance_button.get_child(1) as TextureButton
		if child_img:
			child_img.texture_normal = building_type.sprite_building
		else:
			print("Image sprite can't be not null")
		add_child(instance_button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
