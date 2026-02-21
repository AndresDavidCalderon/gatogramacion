extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Slides.show()
	$Challenge.hide()

func _on_slides_finished() -> void:
	$Slides.hide()
	$Challenge.show()