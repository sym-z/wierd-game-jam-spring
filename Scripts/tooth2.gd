extends AnimatedSprite2D

var on_tooth : bool = false
var brushing : bool = false
var points_touched : int = 0
const MAX_POINTS : int = 5
var clean : bool = false
var clean_frame : int

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if points_touched == MAX_POINTS:
		clean = true
	if clean:
		$".".frame = 0
	pass

func _physics_process(delta):
	if Input.is_action_pressed("Left Click") and on_tooth:
		brushing = true
	elif Input.is_action_pressed("Left Click") and !on_tooth:
		brushing = false
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
		points_touched += 1
	pass # Replace with function body.


func _on_static_body_2d_3_mouse_entered():
	if brushing and on_tooth:
		points_touched += 1
	pass # Replace with function body.


func _on_static_body_2d_4_mouse_entered():
	if brushing and on_tooth:
		points_touched += 1
	pass # Replace with function body.


func _on_static_body_2d_5_mouse_entered():
	if brushing and on_tooth:
		points_touched += 1
	pass # Replace with function body.


func _on_static_body_2d_6_mouse_entered():
	if brushing and on_tooth:
		points_touched += 1
	pass # Replace with function body.
