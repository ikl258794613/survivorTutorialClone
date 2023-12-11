extends Node

@export var end_screen_scence : PackedScene

func _ready():
	$%player.health_component.died.connect(on_player_died)
	

func on_player_died():
	var end_screen_instance = end_screen_scence.instantiate()
	add_child(end_screen_instance)
	end_screen_instance.set_defeat()
