extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Loading Sprite".play()


func _on_loading_sprite_animation_finished():
	# Switch to main menu after animation.
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

