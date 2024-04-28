extends Node2D

var brushing : bool = false
var brush_count : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	for tooth in $Teeth.get_children():
		brush_count += int(tooth.brushing)
	if brush_count:
		brushing = true
	else:
		brushing = false
	brush_count = 0
	
	if !brushing and Input.is_action_pressed("Left Click"):
		print("YEEEEEOWWWCH")

