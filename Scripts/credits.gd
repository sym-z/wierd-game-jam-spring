extends Control

var d : float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	d += delta
	if d > 8.0:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	elif d > 4.0:
		$Background.frame = 1
	else:
		$Background.frame = 0
	pass


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	pass # Replace with function body.


func _on_hidden_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
