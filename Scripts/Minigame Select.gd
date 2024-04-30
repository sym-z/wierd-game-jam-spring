extends Node2D

var eat_grades = [0.24, 0.25, 0.26, 0.27, 0.28, 0.29]
var brush_grades = [21,22,23,24,25,26]
var eat_grade : int = -1
var brush_grade : int =-1
# Called when the node enters the scene tree for the first time.
func _ready():
	$"Best Brush".visible = false
	$"Best Eat".visible = false
	$Grade.visible = false
	grade()
	if Global.brush_best != -1:
		$"Best Brush".text = str(snapped(Global.brush_best, 0.0001))
	else:
		pass
		#$"Best Brush".text = "N/A"
	if Global.eat_best != -1:
		$"Best Eat".text = str(snapped(Global.eat_best,0.0001))
	else:
		pass
		#$"Best Eat".text = "N/A"
	pass # Replace with function body.

func grade():
	if Global.eat_best != -1:
		for x in range(6):
			if Global.eat_best <= eat_grades[x]:
				#print(Global.eat_best, " is <= ", eat_grades[x])
				eat_grade = x
				break;
		if eat_grade == -1:
			eat_grade = 5
	if Global.brush_best != -1:
		for x in range(6):
			if Global.brush_best <= brush_grades[x]:
				brush_grade = x
				break;
		if brush_grade == -1:
			brush_grade = 5
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


func _on_brushing_teeth_mouse_entered():
	$"Best Brush".visible = true
	$"Best Eat".visible = false
	if brush_grade != -1:
		$Grade.visible = true
		$Grade.frame = brush_grade
	pass # Replace with function body.


func _on_brushing_teeth_mouse_exited():
	$"Best Brush".visible = false
	$Grade.visible = false
	pass # Replace with function body.


func _on_make_breakfast_mouse_entered():
	$"Best Brush".visible = false
	$"Best Eat".visible = true
	if eat_grade != -1:
		$Grade.visible = true
		$Grade.frame = eat_grade
	pass # Replace with function body.




func _on_make_breakfast_mouse_exited():
	$"Best Eat".visible = false
	$Grade.visible = false
	pass # Replace with function body.


func _on_hidden_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	pass # Replace with function body.
