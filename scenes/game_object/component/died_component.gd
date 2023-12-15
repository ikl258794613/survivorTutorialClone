extends Node

func _ready():
	# 被殺死的訊號
	# .connect(on_death)
	pass

func on_death():
	owner.queue_free() 
