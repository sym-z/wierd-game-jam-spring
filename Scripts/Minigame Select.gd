extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_brushing_teeth_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_one_minigame.tscn");
	pass # Replace with function body.


func _on_make_breakfast_pressed():
	get_tree().change_scene_to_file("res://Scenes/minigame_2.tscn");
	pass # Replace with function body.


func _on_how_to_pressed():
	get_tree().change_scene_to_file("res://Scenes/how_to_mg_1.tscn");
	pass # Replace with function body.


func _on_how_to_eat_pressed():
	get_tree().change_scene_to_file("res://Scenes/how_to_mg_2.tscn");
	pass # Replace with function body.
