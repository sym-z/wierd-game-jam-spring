extends Node2D

var brushing : bool = false
var brush_count : int = 0
var total_anger : float = 0
var anger_icon
var timer_icon
var time_float : float
var timer
var total_time : float
var clean_count : int = 0
var game_won : bool = false
var game_lost : bool = false
var d : float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	anger_icon = $"Anger Icon"
	timer_icon = $"Time Icon"
	timer = $Timer
	total_time = timer.wait_time
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	d += delta;
	$Cursor.position = Vector2(get_viewport().get_mouse_position().x + 10,get_viewport().get_mouse_position().y+10 )
	if game_won:
		print("WIN")
		if Global.brush_best < 0 or d < Global.brush_best:
			Global.brush_best = d
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene_to_file("res://Scenes/brush_win.tscn")
	elif game_lost:
		print("LOSS")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene_to_file("res://Scenes/brush_lose.tscn")
	if timer.time_left <= 0.0 and !game_won:
		game_lost = true
	print(timer.time_left)
	if timer.time_left >= 0.0:
		time_float = timer.time_left/total_time
	for tooth in $Teeth.get_children():
		brush_count += int(tooth.brushing)
		clean_count += int(tooth.clean)
	if brush_count:
		brushing = true
	else:
		brushing = false
	brush_count = 0
	
	if clean_count >= 7:
		game_won = true
		timer.stop()
	clean_count = 0
	if !brushing and Input.is_action_pressed("Left Click"):
		total_anger += 0.7 * delta
		$Background.animation = "hurt"
	else:
		$Background.animation = "default"
	$Background.play()
	anger_icon.position = lerp($"Min Anger".position, $"Max Anger".position, total_anger)
	timer_icon.position = lerp($"Min Time".position, $"Max Time".position, time_float)
	if(anger_icon.global_position.y <= $"Max Anger".global_position.y):
		game_lost = true
