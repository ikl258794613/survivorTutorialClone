extends Node

signal arena_difficulty_increased(arena_difficulty:int)

const DIFFICULTY_INTERVAL = 5

@export var end_screen_scence:PackedScene

@onready var timer = $Timer

var arena_difficulity = 0
var previous_time = 0 

func _ready():
	previous_time = timer.wait_time
	timer.timeout.connect(on_timer_timeout)
	
func _process(delta):
	var next_time_target = timer.wait_time -(( arena_difficulity + 1 ) * DIFFICULTY_INTERVAL)
	if timer.time_left <= next_time_target:
		arena_difficulity += 1
		arena_difficulty_increased.emit(arena_difficulity)
		
 
func get_time_elapsed():
	return timer.wait_time - timer.time_left

func on_timer_timeout():
	var end_screen_instance = end_screen_scence.instantiate()
	add_child(end_screen_instance)
