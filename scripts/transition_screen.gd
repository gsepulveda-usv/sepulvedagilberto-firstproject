extends Control 

func _ready() -> void:
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://first_level.tscn")
	$".".queue_free()
	
 
