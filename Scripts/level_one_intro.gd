extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Window Frame/Customer 1/Textbox".animation = "greeting"
	$"Window Frame/Customer 1/Textbox".play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_textbox_animation_finished():
	$"Hold Time".start()
	pass # Replace with function body.


func _on_hold_time_timeout():
	get_tree().change_scene_to_file("res://Scenes/minigame_select.tscn")
	pass # Replace with function body.


func _on_hidden_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
