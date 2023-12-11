extends CanvasLayer

signal upgrade_selected(upgrade:AbilityUpgrade)

@export var upgrade_card_screen:PackedScene

@onready var cardcontainer:HBoxContainer = $%CardContainer

func _ready():
	get_tree().paused = true
 
func set_ability_upgrade(upgrades:Array[AbilityUpgrade]):
	for upgrade in upgrades:
		var card_instance = upgrade_card_screen.instantiate()
		cardcontainer.add_child(card_instance)
		card_instance.set_ability_upgrade(upgrade)
		card_instance.selected.connect(on_upgrade_selected.bind(upgrade))

func on_upgrade_selected(upgrade:AbilityUpgrade):
	upgrade_selected.emit(upgrade)
	get_tree().paused = false
	queue_free()
