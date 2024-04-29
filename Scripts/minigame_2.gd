extends Node2D

var pop_time : float
var can_grab : bool = false
var start_time : float = 0.0
var end_time : float = 0.0
var reaction_time : float = 0.0
var d : float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pop_time = randf_range(0.8,6.0)
	$"Pop Time".wait_time = pop_time
	$"Pop Time".start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(Global.eat_best)
	d += delta
	if Input.is_action_just_pressed("Grab Toast"):
		if can_grab:
			end_time = d
			reaction_time = end_time - start_time
			if Global.eat_best < 0 or reaction_time < Global.eat_best:
				Global.eat_best = reaction_time
				
			print("WIN")
			
			get_tree().change_scene_to_file("res://Scenes/brush_win.tscn")
		else:
			print("LOSE")
			get_tree().change_scene_to_file("res://Scenes/brush_lose.tscn")
	#print(can_grab)


func _on_pop_time_timeout():
	$AnimatedSprite2D.play()
	start_time = d
	can_grab = true;
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	can_grab = false
	print("LOSE")
	get_tree().change_scene_to_file("res://Scenes/brush_lose.tscn")
	pass # Replace with function body.
