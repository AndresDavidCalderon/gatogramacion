extends Control

signal finished

var current_slide=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_slide(0)

func set_slide(new_slide):
	for slide in $List.get_children():
		slide.visible=false
	current_slide=new_slide
	$List.get_child(current_slide).visible=true

func _on_next_pressed() -> void:
	if current_slide<$List.get_child_count()-1:
		set_slide(current_slide+1)
	else:
		hide()
		emit_signal("finished")
