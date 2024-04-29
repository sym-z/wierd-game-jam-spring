extends AnimatedSprite2D

var on_tooth : bool = false
var brushing : bool = false
var points_touched : int = 0
const MAX_POINTS : int = 5
var clean : bool = false
var clean_frame : int
var total_points : int
var point_arr = [] 
var full_arr = []
var anger : float = 0.0
var time_added : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(MAX_POINTS):
		full_arr.push_back(1);
	total_points = get_children().size()
	for i in range(total_points):
		var bucket : int = 0
		point_arr.push_back(bucket)
	point_arr.pop_front()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if point_arr == full_arr:
		clean = true
	if clean:
		$".".frame = 0
		var main_timer = get_tree().get_first_node_in_group("Main").timer
		if !time_added:
			main_timer.start(main_timer.time_left + 3.0)
			time_added = true
		else:
			pass
		
	pass

func _physics_process(delta):
	if Input.is_action_pressed("Left Click") and on_tooth:
		brushing = true
	elif Input.is_action_pressed("Left Click") and !on_tooth:
		brushing = false
		anger += 0.01 * delta
		
	else:
		brushing = false

func _on_static_body_2d_mouse_entered():
	on_tooth = true
	pass # Replace with function body.


func _on_static_body_2d_mouse_exited():
	on_tooth = false
	pass # Replace with function body.



func _on_static_body_2d_2_mouse_entered():
	if brushing and on_tooth:
		$StaticBody2D2/CollisionShape2D/Sprite2D.visible = false
		point_arr[0] = 1;
		#points_touched += 1
		
	pass # Replace with function body.


func _on_static_body_2d_3_mouse_entered():
	if brushing and on_tooth:
		$StaticBody2D3/CollisionShape2D/Sprite2D.visible = false
		point_arr[1] = 1;
		#points_touched += 1
	pass # Replace with function body.


func _on_static_body_2d_4_mouse_entered():
	if brushing and on_tooth:
		$StaticBody2D4/CollisionShape2D/Sprite2D.visible = false
		point_arr[2] = 1;
		#points_touched += 1
	pass # Replace with function body.


func _on_static_body_2d_5_mouse_entered():
	if brushing and on_tooth:
		$StaticBody2D5/CollisionShape2D/Sprite2D.visible = false
		point_arr[3] = 1;
		#points_touched += 1
	pass # Replace with function body.


func _on_static_body_2d_6_mouse_entered():
	if brushing and on_tooth:
		$StaticBody2D6/CollisionShape2D/Sprite2D.visible = false
		point_arr[4] = 1;
		#points_touched += 1
	pass # Replace with function body.
